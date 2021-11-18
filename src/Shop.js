import React from 'react';

const Shop = (props) => {
  const buyCloth = (index, price)=>{
    props.buyCloth(index, price)
  }
  return (
    <div className="container container-content">
      <div className="product-collection-grid product-grid bd-bottom">
        <div className="row engoc-row-equal">
          {props.clothes.map((cloth) => (
            <div className="col-xs-6 col-sm-4 col-md-2 col-lg-2 product-item">
              <div className="product-img">
                <a href>
                  <img
                    src={cloth.image}
                    alt=""
                    className="img-responsive"
                  />
                </a>
                <div className="ribbon zoa-hot">
                  <span>{cloth.isUsed ? "Used" : "New"}</span>
                </div>
                <div className="product-button-group">
                 
                  <span onClick = {()=>buyCloth(cloth.index, cloth.price/1000000000000000000)} className="zoa-btn zoa-addcart">
                    <span className="zoa-icon-cart" />
                  </span>
                </div>
              </div>
              <div className="product-info text-center">
                <h3 className="product-title">
                  <a href>{cloth.name}</a>
                </h3>
                <div className="short-desc">
                  <p>
                    {cloth.description}
                  </p>
                </div>
                <div className="product-price">
                  <span>${cloth.price/1000000000000000000}</span>
                </div>
                <button
                onClick = {()=>buyCloth(cloth.index, cloth.price/1000000000000000000)}
                id=""
                className="button_mini zoa-btn"
                type="submit"
                style = {{"marginLeft": "15px", "marginTop": "12px"}}
              >
                Buy Cloth
              </button>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};

export default Shop;
