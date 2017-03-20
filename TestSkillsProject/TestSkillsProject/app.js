(function () {
    'use strict';

    angular.module('app', [])
      .controller('ItemController', ItemController);

    ItemController.$inject = ['$http'];

    function ItemController($http) {
        var vm = this;
        vm.showHighestPrice = false;
        vm.showAllItems = true;
        
     
        console.log('getting inside controller');

        $http.get('http://localhost:56307/api/item').then(function (response) {
            vm.data = response.data;
       
        })

        $http.get('http://localhost:56307/api/item/highest').then(function (response) {
            vm.highestPriceData = response.data;
      
        })


        vm.itemByLowestPrice = function ()
        {
            var url = 'http://localhost:56307/api/item?ItemName=' + vm.lowestItem;

            console.log('about to call url : ' + url + ' to get the lowest price'); 
            $http.get(url).then(function (response) {
                vm.itemByLowest = response.data;

            })
        }
        

        vm.showHighest = function() {
            vm.showHighestPrice = true;
            vm.showAllItems = false;
        }

        vm.showAll = function () {
            vm.showHighestPrice = false;
            vm.showAllItems = true;
        }
    }

        
})();