import React from 'react';
import { useQuery } from '@apollo/react-hooks';
import gql from 'graphql-tag';
import Ayet from "../Ayet";
import { Link, useLocation } from 'react-router-dom';
import Grid from "@material-ui/core/Grid";
import Typography from "@material-ui/core/Typography";

const GET_CHAPTER = gql`
    query Chapter($id: ID!) {
        chapter(id: $id) {
            name
            plName
            ayetsQuantity
            history
            ayets {
                id
                chapterId
                ayetNumber
                content
                note
                ayetImageUrl
                ayetMp3Url
            }
        }
    }
`;

const Chapter = ({match}) => {
  const {loading, error, data} = useQuery(GET_CHAPTER, {variables: {id: match.params.id}});

  if (loading) return 'loading....';
  if (error) return `Error...${error.message}`;

  return (
    <Grid item container alignContent="flex-start" alignItems="center">
      <Grid item xs={12} sm={12}>
        <Typography variant="h2" display="block" dangerouslySetInnerHTML={{__html: data.chapter.name}}/>
        <br/>
        <Typography variant="h3" display="block" dangerouslySetInnerHTML={{__html: data.chapter.plName}}/>
        <br/>
        <Link to="/chapters" className="btn btn-danger">Rozdziały</Link>
        <br/>
        {data.chapter.history}
        <br/>
        {data.chapter.ayets.map(ayet => (<Ayet ayet={ayet} key={ayet.id}/>))}
      </Grid>
    </Grid>
  )
};

export default Chapter;
