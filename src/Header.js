const Header = (props) => {
  return (
    <header id="header" className="header-v1">
      <div className="header-center">
        <div className="container container-content">
          <div className="row flex align-items-center justify-content-between">
            <div className=" flex justify-content-center">
              <a href="#">
                <img src="img/logo.png" alt="" className="img-reponsive" />
              </a>
            </div>
            <div className="col-md-4 col flex justify-content-end">
                <h3>${props.balance}cUSD</h3>
            </div>
          </div>
        </div>
      </div>
    </header>
  );
};

export default Header;
