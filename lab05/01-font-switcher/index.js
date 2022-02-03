let curr_font = 1.4;

const makeBigger = () => {
//   alert('make bigger!');
   curr_font += 0.2;
   setFont();
};

const makeSmaller = () => {
//   alert('make smaller!');
   curr_font -= 0.2;
   setFont();
};

const setFont = () => {
    document.querySelector('.content').style.fontSize = `${curr_font}em`
}

document.querySelector('#a1').addEventListener('click', makeBigger);
document.querySelector('#a2').addEventListener('click', makeSmaller);

