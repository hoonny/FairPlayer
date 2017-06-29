
function AjaxDataHelper() {

    //멤버변수 정의
    var _Url,
        _AsynType = false,
        _Parameter,
        _Result = null,
        _CallType = {
            "POST": "POST",
            "PUT": "PUT",
            "DELETE": "DELETE",
            "GET": "GET"
        };




    //공용메소드 정의
    this.Insert = Insert;;
    this.Update = Update;
    this.Delete = Delete;
    this.Select = Select;

    this.Result = Result;



    //공용Enum유형
    this.SyncType = {
        "ASync": true,
        "Sync":false
    };



    function Insert(url, params) {
        _Url = url;
        _Parameter = params;
        ExecuteAjaxCall(_CallType.POST);
    };

    function Update(url, params) {
        debugger;
        _Url = url;
        _Parameter = params;
        ExecuteAjaxCall(_CallType.PUT);
    };

    function Delete(url, params) {
        _Url = url;
        _Parameter = params;
        ExecuteAjaxCall(_CallType.DELETE);
    };

    function Select(url, params) {
        _Url = url;
        _Parameter = params;
        ExecuteAjaxCall(_CallType.GET);
    };


    function ExecuteAjaxCall(methodType) {
        $.ajax({
            type: methodType,
            url: _Url,
            async: _AsynType,
            data:_Parameter,
            contentType: "application/json",
            success: function (data) {
                _Result = data;
            },
            error: function (error) {
                alert(error.status + "<!----!>" + error.statusText);
            }
        });
    };

    function Result() {
        return _Result;
    }

};