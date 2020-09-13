<template>
  <div>
    <h1>Valuate Your Property Now</h1>
    <div>
      <form class="valuation-form" @submit.prevent="onSubmit">
        <p>
        <label>Address</label> 
        <input id="address" v-model="address" placeholder="address">
        </p>
        <p>
        <label>Building Age</label>
        <input id="BuildingAge" v-model="BuildingAge" placeholder="BuildingAge">
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
const baseUrl = 'http://propertypricemodel-env.eba-fspp4avq.ap-southeast-1.elasticbeanstalk.com/predict'

export default {
  name: "Valuation",
  methods: {
    async onSubmit(){
      console.log({address: this.address, age: this.age})
      const res = await axios.post(baseUrl, 
        {
          HMA_lat: 22.33012,
          HMA_Lng: 114.1641913,
          blg_age: 19
        },
        {
          headers:{
            'Access-Control-Allow-Origin': '*',
            'Content-Type': 'application/json',
          }
        }
      )
      alert(res.data)
    }
  },
 
}

</script>

<style scoped>

</style>