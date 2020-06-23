let employeeToggle = document.querySelector(".selector-of");
let managerToggle = document.querySelector(".selector-on");
let manager = document.querySelector(".manager");
let employee = document.querySelector(".employee");

let changer = function (e) {
  let temp = document.querySelector(".selector-on");
  let temp2 = e.currentTarget;
  if (Array.from(temp2.classList).includes("selector-of")) {
    temp2.classList.remove("selector-of");
    temp.classList.remove("selector-on");
    temp.classList.add("selector-of");
    temp2.classList.add("selector-on");
    manager.innerHTML = "";
    employee.innerHTML = `<div class="form-group">
      <label for="profile_status">Status</label>
      <input class="form-control" type="text" name="profile[employee]" id="profile_employee">
    </div>`;
  }
};
let changer2 = function (e) {
  let temp = document.querySelector(".selector-on");
  let temp2 = e.currentTarget;
  if (Array.from(temp2.classList).includes("selector-of")) {
    temp2.classList.remove("selector-of");
    temp.classList.remove("selector-on");
    temp.classList.add("selector-of");
    temp2.classList.add("selector-on");
    employee.innerHTML = "";
    manager.innerHTML = `<div class="form-group">
      <label for="profile_status">Status</label>
      <input class="form-control" type="text" name="profile[manager]" id="profile_manager">
    </div>`;
  }
};
employeeToggle.addEventListener("click", changer);

managerToggle.addEventListener("click", changer2);
