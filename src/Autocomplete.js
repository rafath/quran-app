import React, { useState, useEffect } from 'react';
import TextField from '@material-ui/core/TextField';
import MuiAutocomplete from '@material-ui/lab/Autocomplete';
import LocationOnIcon from '@material-ui/icons/LocationOn';
import Grid from '@material-ui/core/Grid';
import Typography from '@material-ui/core/Typography';
import { makeStyles } from '@material-ui/core/styles';
import parse from 'autosuggest-highlight/parse';
import throttle from 'lodash/throttle';
import CircularProgress from '@material-ui/core/CircularProgress'

const autocompleteService = { current: null };

const useStyles = makeStyles((theme) => ({
  icon: {
    color: theme.palette.text.secondary,
    marginRight: theme.spacing(2),
  },
}));

const handleChapter = (event, value) => {
  debugger;
};

export const Autocomplete = () => {
  const classes = useStyles();

  const [open, setOpen] = React.useState(false);
  const [options, setOptions] = React.useState([]);
  const loading = open && options.length === 0;

  React.useEffect(() => {
    let active = true;

    if (!loading) {
      return undefined;
    }

    (async () => {
      const response = await fetch('http://localhost:3001/chapters/');
      const countries = await response.json();

      if (active) {
        setOptions(countries.data.map(chapter => ({ id: chapter.id,
          name: `${chapter.attributes.name} - ${chapter.attributes.pl_name}`,
          ayets_quantity: chapter.attributes.ayets_quantity })));
      }
    })();

    return () => {
      active = false;
    };
  }, [loading]);

  React.useEffect(() => {
    if (!open) {
      setOptions([]);
    }
  }, [open]);


  // const [value, setValue] = React.useState(null);
  // const [inputValue, setInputValue] = React.useState('');
  // const [options, setOptions] = React.useState([]);
  // const loaded = React.useRef(false);

  // const [data, setData] = useState({});
  // console.log('---------', { data });
  // useEffect(() => {
  //   let active = true;
  //
  //   if (active) {
  //     const fetchData = async () => {
  //       const result = await axios('http://localhost:3001/chapters/');
  //       setData(result.data);
  //     }
  //     fetchData()
  //   }
  //   return () => {
  //     active = false;
  //   };
  // }, [data]);


  // useEffect(() => {
  //   async function fetchData() {
  //     // You can await here
  //     const response = await MyAPI.getData(someId);
  //     // ...
  //   }
  //   fetchData();
  // }, [someId]);

  // const fetch = React.useMemo(
  //   () =>
  //     throttle((request, callback) => {
  //       autocompleteService.current.getPlacePredictions(request, callback);
  //     }, 200),
  //   [],
  // );
  //
  // React.useEffect(() => {
  //   let active = true;
  //
  //   if (!autocompleteService.current && window.google) {
  //     autocompleteService.current = new window.google.maps.places.AutocompleteService();
  //   }
  //   if (!autocompleteService.current) {
  //     return undefined;
  //   }
  //
  //   if (inputValue === '') {
  //     setOptions(value ? [value] : []);
  //     return undefined;
  //   }
  //
  //   fetch({ input: inputValue }, (results) => {
  //     if (active) {
  //       let newOptions = [];
  //
  //       if (value) {
  //         newOptions = [value];
  //       }
  //
  //       if (results) {
  //         newOptions = [...newOptions, ...results];
  //       }
  //
  //       setOptions(newOptions);
  //     }
  //   });
  //
  //   return () => {
  //     active = false;
  //   };
  // }, [value, inputValue, fetch]);

  console.log('-------', options);
  return (
    <MuiAutocomplete
      id="google-map-demo"
      style={{ width: 300 }}
      open={open}
      onOpen={() => {
        setOpen(true);
      }}
      onClose={() => {
        setOpen(false);
      }}
      onChange={handleChapter}
      getOptionSelected={(option, value) => option.name === value.name}
      getOptionLabel={(option) => option.name}
      options={options}
      loading={loading}
      includeInputInList
      filterSelectedOptions
      renderInput={(params) => (
        <TextField
          {...params}
          label="Asynchronous"
          variant="outlined"
          InputProps={{
            ...params.InputProps,
            endAdornment: (
              <React.Fragment>
                {loading ? <CircularProgress color="inherit" size={20}/> : null}
                {params.InputProps.endAdornment}
              </React.Fragment>
            ),
          }}
        />
      )}
    />
  );
}

export default Autocomplete;
