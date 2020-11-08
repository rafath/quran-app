import React from 'react';
import { AppBar, Toolbar, Typography, Button, IconButton, Grid, Box } from '@material-ui/core';
import { TextField, Select } from '@material-ui/core';
import { makeStyles } from '@material-ui/styles'
import Autocomplete from './Autocomplete';
import BottomNavigationAction from "@material-ui/core/BottomNavigationAction";
import { Link } from "react-router-dom";
import Home from "@material-ui/icons/Home";
import LayersClear from "@material-ui/icons/LayersClear";
import Layers from "@material-ui/icons/Layers";
import AddBox from "@material-ui/icons/AddBox";
import BottomNavigation from "@material-ui/core/BottomNavigation";

const useStyle = makeStyles(() => ({
  typography: {
    flex: 1,
    color: 'yellow'
  },
  appBar: {
    top: 'auto',
    bottom: 0,
  }
}));

const Header = () => {
  const classes = useStyle();

  return (
    <AppBar position="fixed" className={classes.appBar} color="secondary">
      <BottomNavigation
        value={12}
        onChange={() => {}}
        showLabels
        className={classes.root}
      >
        <BottomNavigationAction component={Link} to="/" label="Główna" icon={<Home />} />
        <BottomNavigationAction component={Link} to="/chapters" label="Zamknięte" icon={<LayersClear />} />
        <BottomNavigationAction component={Link} to="/open-orders" label="Oczekujące" icon={<Layers />} />
        <BottomNavigationAction component={Link} to="/courses" label="Nowe" icon={<AddBox />} />
      </BottomNavigation>
      {/*<Box mx={2}>*/}
      {/*  <form className={classes.root} noValidate autoComplete="off">*/}
      {/*    <Grid container spacing={3}>*/}
      {/*      <Grid item xs={6}>*/}

      {/*        <Autocomplete />*/}

      {/*      </Grid>*/}
      {/*      <Grid item xs={6}>*/}
      {/*        <TextField id="filled-basic" label="Ayet" variant="filled"/>*/}
      {/*      </Grid>*/}
      {/*    </Grid>*/}
      {/*  </form>*/}
      {/*</Box>*/}
    </AppBar>
  )
};

export default Header;
