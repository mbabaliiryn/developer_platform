console.log("test");

// let timeVar = setInterval(countTimer, 1000);
let timer = document.getElementById("timer");
let buttonTimer = document.getElementById("button-timer");
let buttonTimerStop = document.getElementById("button-timer-of");
let totalSeconds = 0;
let hiddenAmount = document.getElementById("amount_real");
let setAmount = document.getElementById("set-value");
let setTimer = document.getElementById("set-timer");
setAmount.addEventListener("click", (e) => {
  e.stopPropagation();
  e.preventDefault();
  setAmount.classList.add("btn-success");
  setAmount.classList.remove("btn-outline-success");
  setTimer.classList.remove("btn-success");
  setTimer.classList.add("btn-outline-success");
  amountShow();
  timerHide();
  hiddenAmount.value = 0;
});
setTimer.addEventListener("click", (e) => {
  e.preventDefault();
  setTimer.classList.add("btn-success");
  setTimer.classList.remove("btn-outline-success");
  setAmount.classList.remove("btn-success");
  setAmount.classList.add("btn-outline-success");
  amountHide();
  timerShow();
});
buttonTimer.addEventListener("click", (e) => {
  e.stopPropagation();
  e.preventDefault();
  test = setInterval(countTimer, 1000);
  document.getElementById("button-timer-of").classList.add("d-inline-block");
  document.getElementById("button-timer-of").classList.remove("d-none");
  document.getElementById("button-timer").classList.add("d-none");
  document.getElementById("button-timer").classList.remove("d-inline-block");
});

buttonTimerStop.addEventListener("click", (e) => {
  e.stopPropagation();
  e.preventDefault();
  clearInterval(test);
  document.getElementById("button-timer").classList.add("d-inline-block");
  document.getElementById("button-timer").classList.remove("d-none");
  document.getElementById("button-timer-of").classList.add("d-none");
  document.getElementById("button-timer-of").classList.remove("d-inline-block");
});
function countTimer() {
  ++totalSeconds;

  let hour = Math.floor(totalSeconds / 3600);
  let minute = Math.floor((totalSeconds - hour * 3600) / 60);
  let seconds = totalSeconds - (hour * 3600 + minute * 60);
  timer.innerHTML = hour + ":" + minute + ":" + seconds;
  hiddenAmount.value = totalSeconds;
}

function amountHide() {
  let temp = document.getElementById("amount-to-hide");
  temp.parentElement.classList.remove("d-block");
  temp.parentElement.classList.add("d-none");
}

function timerHide() {
  let temp = document.querySelector(".timer");
  temp.classList.remove("d-block");
  temp.classList.add("d-none");
}

function amountShow() {
  let temp = document.getElementById("amount-to-hide");
  temp.parentElement.classList.remove("d-none");
  temp.parentElement.classList.add("d-block");
}

function timerShow() {
  let temp = document.querySelector(".timer");
  temp.classList.remove("d-none");
  temp.classList.add("d-block");
}
