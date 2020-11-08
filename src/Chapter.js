import React, { useState, useEffect } from 'react';
import Ayet from './Ayet';

const Chapter = ({ id, name, ayets_quantity }) => {
  const [page, setPage] = React.useState(1);
  const [ayets, setAyets] = React.useState([]);
  const loading = ayets.length === 0;

  React.useEffect(() => {
    (async () => {
      const response = await fetch(`http://localhost:3001/${id}/ayets/${page}`);
      const body = await response.json();
      setAyets(body.data.map(ayet => (ayet.attributes)));
    })();
  }, []);


  return (
    <div className="ayet">
      <h3>{name}</h3>
      {ayets.map(ayet => (<Ayet ayet={ayet} key={ayet.ayet_number} />))}
    </div>
  )
};

export default Chapter;
