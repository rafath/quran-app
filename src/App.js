import React, { useState } from 'react';
import Grid from '@material-ui/core/Grid';
import { Switch, Route } from 'react-router-dom'
import { Button } from '@material-ui/core'
import { makeStyles, useTheme } from '@material-ui/core/styles';
import { orange, yellow, deepPurple } from '@material-ui/core/colors';

import Header from './Header';
import Home from './components/Home';
import Chapters from './components/Chapters';
import Chapter from './components/Chapter';

const useStyle = makeStyles(theme => {
  return {
    bordered: {
      border: '1px solid #000'
    },
    button: {
      backgroundColor: yellow[100],
      [theme.breakpoints.up('md')]: {
        backgroundColor: deepPurple[50]
      }
    }
  }
});

const App = () => {
  const classes = useStyle();
  const theme = useTheme();
  const [chapter, selectChapter] = useState(null)

  return (
    <Grid container direction="column" justify="space-between" style={{minHeight: '100vh'}}>
      <Grid item className={classes.bordered}>
        <Header/>
      </Grid>
      <Switch>
        <Route exact path="/" component={Home} />
        <Route path="/chapters" component={Chapters} />
        <Route path="/chapter/:id" component={Chapter} />
      </Switch>
    </Grid>

  );
}

export default App;

//<Grid item container alignContent="flex-start" alignItems="stretch"
//             style={{border: '1px solid #000', flexGrow: '2'}}>
//         <Grid item xs={false} sm={2}/>
//         <Grid item xs={12} sm={8}>
//           {
//             chapter ?
//               <Chapter selectChapter={selectChapter} chapter={chapter}/> :
//               <Chapters selectChapter={selectChapter}/>
//           }
//           {/*<Chapter id={1} name="fatiha" ayets_quantity={7} />*/}
//         </Grid>
//         <Grid item xs={false} sm={2}/>
//       </Grid>
//       <Grid item>
//       </Grid>
// <Route path="/sign-in" component={SignInPage} />
//         <Route path="/courses" component={Courses} />
//         <Route path="/new_order" component={NewOrder} />
//         <Route path="/orders/:id" component={Orders} />
//         <Route path="/open-orders" component={OpenOrders} />
