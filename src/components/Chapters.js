import React from 'react';
import { useQuery } from '@apollo/react-hooks';
import gql from 'graphql-tag';
import Grid from "@material-ui/core/Grid";
import { Link } from "react-router-dom";
const GET_CHAPTERS = gql`
    {
        chapters {
            id
            name
            plName
            ayetsQuantity
            chapterNumber
        }
    }
`;

const Chapters = ({selectChapter}) => {
    const  { loading, error, data } = useQuery(GET_CHAPTERS);

    if (loading) return 'loading....';
    if (error) return `Error...${error.message}`;

    return (
      <Grid item container alignContent="flex-start" alignItems="stretch"
            style={{border: '1px solid #000', flexGrow: '2'}}>
          <Grid item xs={false} sm={2}/>
          <Grid item xs={12} sm={8}>
              <div className="flex flex-wrap items-center">
                  {data.chapters.map(chapter => (
                    <Link to={`/chapter/${chapter.id}`} key={chapter.id} className="lg:w-1/3 w-full p-4 text-center inline">{chapter.name}</Link>
                  ))}
              </div>
          </Grid>
          <Grid item xs={false} sm={2}/>
      </Grid>
    )
};

export default Chapters;
