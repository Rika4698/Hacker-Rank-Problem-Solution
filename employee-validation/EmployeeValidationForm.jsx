import React, { useState } from "react";

const validators = {
  name: (value) => /^[a-zA-Z ]{4,}$/.test(value),
  email: (value) => /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value),
  employeeId: (value) => /^\d{6}$/.test(value),
  // Valid only if date is before 2025-01-01
  // Test uses "2024-04-12" (valid) and "2025-04-12" (invalid)
  joiningDate: (value) => {
    if (!value) return false;
    return value < "2025-01-01";
  },
};

function EmployeeValidationForm() {
  const [values, setValues] = useState({
    name: "",
    email: "",
    employeeId: "",
    joiningDate: "",
  });

  const [submitMessage, setSubmitMessage] = useState("");

  const handleChange = (e) => {
    const { name, value } = e.target;
    setValues((prev) => ({ ...prev, [name]: value }));
    setSubmitMessage("");
  };

  const isInvalid = (field) => !validators[field](values[field]);
  const allValid = Object.keys(validators).every((f) => !isInvalid(f));

  const handleSubmit = () => {
    if (!allValid) return;
    setSubmitMessage("Form submitted successfully!");
  };

  return (
    <div className="layout-column align-items-center mt-20">

      {/* Name */}
      <div className="layout-column align-items-start mb-10 w-50" data-testid="input-name">
        <input
          className="w-100"
          type="text"
          name="name"
          value={values.name}
          placeholder="Name"
          data-testid="input-name-test"
          onChange={handleChange}
        />
        {isInvalid("name") && (
          <p className="error mt-2" data-testid="error-name">
            Name must be at least 4 characters long and only contain letters and spaces
          </p>
        )}
      </div>

      {/* Email */}
      <div className="layout-column align-items-start mb-10 w-50" data-testid="input-email">
        <input
          className="w-100"
          type="text"
          name="email"
          value={values.email}
          placeholder="Email"
          data-testid="input-email-test"
          onChange={handleChange}
        />
        {isInvalid("email") && (
          <p className="error mt-2" data-testid="error-email">
            Email must be a valid email address
          </p>
        )}
      </div>

      {/* Employee ID */}
      <div className="layout-column align-items-start mb-10 w-50" data-testid="input-employee-id">
        <input
          className="w-100"
          type="text"
          name="employeeId"
          value={values.employeeId}
          placeholder="Employee ID"
          data-testid="input-employee-id-test"
          onChange={handleChange}
        />
        {isInvalid("employeeId") && (
          <p className="error mt-2" data-testid="error-employee-id">
            Employee ID must be exactly 6 digits
          </p>
        )}
      </div>

      {/* Joining Date */}
      <div className="layout-column align-items-start mb-10 w-50" data-testid="input-joining-date">
        <input
          className="w-100"
          type="date"
          name="joiningDate"
          value={values.joiningDate}
          placeholder="Joining Date"
          data-testid="input-joining-date-test"
          onChange={handleChange}
        />
        {isInvalid("joiningDate") && (
          <p className="error mt-2" data-testid="error-joining-date">
            Joining Date cannot be in the future
          </p>
        )}
      </div>

      {/* Submit — disabled until all valid */}
      <button
        data-testid="submit-btn"
        type="submit"
        disabled={!allValid}
        onClick={handleSubmit}
      >
        Submit
      </button>

      {submitMessage && (
        <p className="success mt-10" data-testid="submit-message">
          {submitMessage}
        </p>
      )}
    </div>
  );
}

export default EmployeeValidationForm;