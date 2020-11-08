import React from 'react';
import Grid from '@material-ui/core/Grid';

const Home = () => (
  <Grid item container alignContent="flex-start" alignItems="stretch"
        style={{border: '1px solid #000', flexGrow: '2'}}>
    <Grid item xs={false} sm={2}/>
    <Grid item xs={12} sm={8}>
      Hello World
    </Grid>
    <Grid item xs={false} sm={2}/>
  </Grid>
);

export default Home;
