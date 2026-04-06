import  { useState } from "react";

function Slides({ slides }) {
  const [currentIndex, setCurrentIndex] = useState(0);

  const handleRestart = () => {
    setCurrentIndex(0);
  };

  const handlePrev = () => {
    setCurrentIndex((prev) => prev - 1);
  };

  const handleNext = () => {
    setCurrentIndex((prev) => prev + 1);
  };

  return (
    <div>
      <div id="navigation" className="text-center">
        <button
          data-testid="button-restart"
          className="small outlined"
          onClick={handleRestart}
          disabled={currentIndex === 0}
        >
          Restart
        </button>

        <button
          data-testid="button-prev"
          className="small"
          onClick={handlePrev}
          disabled={currentIndex === 0}
        >
          Prev
        </button>

        <button
          data-testid="button-next"
          className="small"
          onClick={handleNext}
          disabled={currentIndex === slides.length - 1}
        >
          Next
        </button>
      </div>

      <div id="slide" className="card text-center">
        <h1 data-testid="title">{slides[currentIndex].title}</h1>
        <p data-testid="text">{slides[currentIndex].text}</p>
      </div>
    </div>
  );
}

export default Slides;