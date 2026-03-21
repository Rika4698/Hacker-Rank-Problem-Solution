import React, { useState } from "react";
import "./index.css";

function ProductValidation() {

  const [name, setName] = useState("");
  const [quantity, setQuantity] = useState("");

  const [touched, setTouched] = useState({
    name: false,
    quantity: false
  });

  const validateName = () => {
    if (!name) return "Product name is required";
    return "";
  };

  const validateQuantity = () => {
    if (!quantity) return "Quantity is required";
    if (Number(quantity) <= 0) return "Quantity should be greater than 0";
    return "";
  };

  const nameError = touched.name ? validateName() : "";
  const quantityError = touched.quantity ? validateQuantity() : "";

  const isFormValid =
    name &&
    quantity &&
    !validateName() &&
    !validateQuantity();

  return (
    <div className="layout-column justify-contents-center align-items-center">
      <section className="card pa-50">

        <form className="layout-column" noValidate>

          {/* Name */}
          <label>
            <input
              type="text"
              value={name}
              onInput={(e) => {
                setName(e.target.value);
                setTouched({ ...touched, name: true });
              }}
              data-testid="name-input"
              className="white large outlined"
              placeholder="Product name"
            />

            {nameError && (
              <p data-testid="name-input-error" className="error-text form-hint">
                {nameError}
              </p>
            )}
          </label>

          {/* Quantity */}
          <label>
            <input
              type="number"
              value={quantity}
              onInput={(e) => {
                setQuantity(e.target.value);
                setTouched({ ...touched, quantity: true });
              }}
              data-testid="quantity-input"
              className="white large outlined"
              placeholder="Quantity"
            />

            {quantityError && (
              <p data-testid="quantity-input-error" className="error-text form-hint">
                {quantityError}
              </p>
            )}
          </label>

          <button
            className="mt-50"
            type="submit"
            data-testid="submit-button"
            disabled={!isFormValid}
          >
            Submit
          </button>

        </form>
      </section>
    </div>
  );
}

export default ProductValidation;