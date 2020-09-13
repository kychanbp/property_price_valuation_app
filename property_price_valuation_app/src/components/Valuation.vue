<template>
  <div>
    <h1>Valuate Your Property Now</h1>
      <label>Address</label> 
      <vue-google-autocomplete
            ref="address"
            id="map"
            classname="form-control"
            placeholder="Please type your address"
            v-on:placechanged="getAddressData"
            country="hk"
        >
        </vue-google-autocomplete>
      <div>
      <form class="valuation-form" @submit.prevent="onSubmit">
        <p>
        <label>Building Age</label>
        <input id="age" v-model="age" placeholder="BuildingAge">
        </p>
        <p>
         <input type="submit" value="submit">
        </p>
      </form>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import VueGoogleAutocomplete from 'vue-google-autocomplete';
const baseUrl = 'http://PropertyPriceModel-env.eba-fspp4avq.ap-southeast-1.elasticbeanstalk.com/predict'

export default {
  components:{VueGoogleAutocomplete},
  name: "Valuation",
  data: function (){
    return {
      address:'',
      placeData:{},
      id:'',
      age:0
    }
  },
  mounted() {
    // To demonstrate functionality of exposed component functions
    // Here we make focus on the user input
    this.$refs.address.focus();
  },
  methods: {
    /**
    * When the location found
    * @param {Object} addressData Data of the found location
    * @param {Object} placeResultData PlaceResult object
    * @param {String} id Input container ID
    */
    getAddressData: function (addressData, placeResultData, id) {
        this.address = addressData;
        this.placeData = placeResultData;
        this.id = id;
      },

    async onSubmit(){
      console.log({address: this.address, age: this.age})
      const res = await axios.post(baseUrl, 
        {
          "HMA_lat": this.address.latitude,
          "HMA_Lng": this.address.longitude,
          "blg_age": this.age
        },
        {
          headers:{
            'Content-Type': 'application/json',
          }
        }
      )
      console.log(res)
      alert(res.data.prediction)
    }
  },
 
}

</script>

<style scoped>

</style>