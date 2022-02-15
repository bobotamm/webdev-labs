/* 
  See Smashing Magazine Tutorial:
  https://www.smashingmagazine.com/2021/11/dyslexia-friendly-mode-website/
*/


const initPage = () => {
    // toggle dyslexia support
    const isPressed = window.localStorage.getItem('dyslexic') === 'true';
    if(isPressed) {
        document.body.classList.add('dyslexia-mode');
    }

    // set button to pressed if appropriate
    const toggle = document.querySelector('#dyslexia-toggle');
    if(isPressed) {
        toggle.setAttribute('aria-pressed', 'true');
    }

    toggle.addEventListener('click', toggleEventHandler);
}

const toggleEventHandler = ev => {
    let pressed = ev.currentTarget.getAttribute('aria-pressed') === 'true';

    // toggle button's dyslexia mode
    ev.currentTarget.setAttribute('aria-pressed', String(!pressed));

    // toggle the .dyslexia-mode class
    document.body.classList.toggle("dyslexia-mode")

    // persist the setting to local storage
    window.localStorage.setItem('dyslexia', String(!pressed));
}

initPage();
