(function () {
    'use strict';

    angular.module('app', [])
      .controller('ItemController', ItemController);

    ItemController.$inject = ['$http'];

    function ItemController($http) {
        var vm = this;

        console.log('getting inside controller');

        $http.get('http://localhost:56307/api/item').then(function (response) {
            vm.data = response.data;
            console.log(vm.data);
        })
    }
})();