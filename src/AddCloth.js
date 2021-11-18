import React, { useState } from "react";

const AddCloth = (props) => {
  const [name, setName] = useState("");
  const [image, setImage] = useState("");
  const [description, setDescription] = useState("");
  const [price, setPrice] = useState(0);
  const [isUsed, setIsUsed] = useState(false);

  const convertToBool = (text) => {
    if (text === "true") {
      return true;
    } else if (text === "false") {
      return false;
    }
  };

  const formSubmit = (e) => {
    e.preventDefault();
    console.log(isUsed);
    props.addCloth(name, description, image, price, isUsed);
    setName("");
    setImage("");
    setPrice("");
    setDescription("");
  };

  return (
    <div className="newsletter">
      <div className="container">
        <h1>Add Cloth</h1>
        <div className="row">
          <div className=" col-12">
            <form className="form_newsletter" onSubmit={formSubmit}>
              <input
                onChange={(e) => setName(e.target.value)}
                type="text"
                placeholder="Name"
                className="newsletter-input form-control"
                value={name}
              />
              <input
                onChange={(e) => setDescription(e.target.value)}
                type="text"
                placeholder="Description"
                className="newsletter-input form-control"
                value={description}
              />
              <input
                onChange={(e) => setImage(e.target.value)}
                type="text"
                placeholder="Image Link"
                className="newsletter-input form-control"
                value={image}
              />
              <input
                onChange={(e) => setPrice(e.target.value)}
                type="text"
                placeholder="Price"
                className="newsletter-input form-control"
                value={price}
              />
              <select
                onChange={(e) => setIsUsed(convertToBool(e.target.value))}
                className="newsletter-input form-control"
                style={{ marginLeft: "15px" }}
              >
                <option value="" disabled selected>
                  Check Is Used
                </option>
                <option value="true">Used</option>
                <option value="false">New</option>
              </select>
              <button
                id=""
                className="button_mini zoa-btn"
                type="submit"
                style={{ marginLeft: "15px", marginTop: "12px" }}
              >
                Add Products
              </button>
            </form>
          </div>
        </div>
      </div>
    </div>
  );
};

export default AddCloth;
