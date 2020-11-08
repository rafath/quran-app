import React, { useState } from 'react';
import ReactAudioPlayer from 'react-audio-player';

const Ayet = ({ ayet: { chapterId, ayetNumber, content, note, ayetImageUrl, ayetMp3Url } }) => {

  return (
    <div className="ayet">
      <img src={ayetImageUrl}  />
      <br/>
      <ReactAudioPlayer
        src={ayetMp3Url}
        controls
        loop={false}
      />
      <br/>
      {ayetNumber} <span dangerouslySetInnerHTML={{__html: content}} />
      <br/>
    </div>
  )
};

export default Ayet;
