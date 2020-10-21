<template>
  <!-- eslint-disable	 -->
  <div class="SOAP">
    <!-- Sidebar -->
    <SidebarNav />

    	 <div id="content">
		      <div class="row mb-4">
		        <div class="col col-md-4">
		          <router-link to="/riwayat_medis">
		            <div class="card border-left-primary shadow-none">
		              <div class="card-body">
		                <div class="row no-gutters align-items-center">
		                  <div class="text-md font-weight-bold text-primary text-uppercase"> NAMA : {{ pasien_rekmed.nama}}</div>
		               </div>
		             </div>
		            </div>
		          </router-link>
		         </div>
		         <div class="col col-md-3">
		          <router-link to="/riwayat_medis">
		            <div class="card border-left-primary shadow-none">
		              <div class="card-body">
		                <div class="row no-gutters align-items-center">
		                 <div class="text-md font-weight-bold text-primary text-uppercase">ID PASIEN : {{ pasien_rekmed.ID }}</div>
		                </div>
		              </div>
		             </div>
		          </router-link>
		        </div>
		      </div>
		      <div class="card mb-2 mt-2">
		        <div class="card-body plan-card-kotak" id="card-racikan">
		          <div class="card-header font-weight-bold bg-dark text-white">
		            <div class="row">
		              <div class="col-11">SOAP</div>
		            </div>
		          </div>
		           <div class="card my-3">
		           	<div class="row">
		           		<div class="col-6">
			           	   <div class="row p-4">
					           <div class="col-3">Subjektif</div>
						       <div class="col-9">
						   		    <tags-input element-id="tags" v-model="subjektif" v-bind:key="index"></tags-input>
						       </div>
					       </div>
				           <div class="row p-4">
				           		<div class="col-3">Objektif</div>
				           		<div class="col-9">
				           		  <div class="form-row">
						            <div class="col-md-6">
						              <label for="inputEmail4">N</label>
						              <div class="input-group mb-3">
						                <input type="text" class="form-control">
						                <div class="input-group-append">
						                  <span class="input-group-text" id="basic-addon2">x/min</span>
						                </div>  
						              </div>
						            </div>
						            <div class="col-md-6">
						              <label for="inputPassword4">TD</label>
						              <div class="input-group mb-3">
						                <input type="text" class="form-control">
						                <div class="input-group-append">
						                  <span class="input-group-text" id="basic-addon2">mmHg</span>
						                </div> 
						              </div>
						            </div>
						          </div>
						          <div class="form-row">
						          	<div class="col-md-6">
						              <label for="inputEmail4">ST</label>
						              <div class="input-group mb-3">
						                <input type="text" class="form-control">
						                <div class="input-group-append">
						                  <span class="input-group-text" id="basic-addon2">°C</span>
						                </div> 
						              </div>
						            </div>
						            <div class="col-md-6">
						              <label for="inputPassword4">RR</label>
						              <div class="input-group mb-3">
						                <input type="text" class="form-control">
						                <div class="input-group-append">
						                  <span class="input-group-text" id="basic-addon2">x/min</span>
						                </div>
						              </div>
						            </div>
						          </div>
						          <div class="form-row">
						          	<div class="col-md-6">
						              <label for="inputEmail4">BB</label>
						              <div class="input-group mb-3">
						                <input type="text" class="form-control">
						                <div class="input-group-append">
						                  <span class="input-group-text" id="basic-addon2">kg</span>
						                </div>
						              </div>
						            </div>
						            <div class="col-md-6">
						              <label for="inputPassword4">TB</label>
						              <div class="input-group mb-3">
						                <input type="text" class="form-control">
						                <div class="input-group-append">
						                  <span class="input-group-text" id="basic-addon2">cm</span>
						                </div>
						              </div>
						            </div>
						          </div>
						          <div class="form-row">
						            <div class="form-group col-md-12">
						              <label for="exampleFormControlTextarea1">Hasil Pemeriksaan</label>
						              <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
						            </div>
						          </div>
				           		</div>
				           </div>
				           <div class="row p-4">
				           		<div class="col-3">Assesment</div>
				           		<div class="col-9">
						   		    <tags-input element-id="tags" v-model="assesment"></tags-input>
				           		</div>
				           </div>
				           <div class="row p-4">
				           	   <div class="col-3">Plan</div>
						       <div class="col-9">
						       		<div class="row">
						       			<div class="col">
								   	    	<tags-input element-id="tags" v-model="plan_diagnosis"></tags-input>
						       			</div>
						       		</div>
						       		<div class="row my-3">
						       			<div class="col">
								   	    	<tags-input element-id="tags" v-model="plan_terapi"></tags-input>
						       			</div>
						       		</div>
						       		<div class="row">
						       			<div class="col">
								   	    	<tags-input element-id="tags" v-model="plan_edukasi"></tags-input>
						       			</div>
						       		</div>
						       </div>
				           </div>
		           		</div>
		           		<div class="col-6">
		           			<div class="row p-4">
					           <div class="col-3">Diagnosis</div>
						       <div class="col-9">
						   		    <tags-input element-id="tags" v-model="diagnosis" v-bind:key="index"></tags-input>
						       </div>
					       </div>
					       <div class="row p-4">
					           <div class="col-3">Tindakan</div>
						       <div class="col-9">
						   		    <tags-input element-id="tags" v-model="tindakan" v-bind:key="index"></tags-input>
						       </div>
					       </div>
		           		</div>
		           	</div>
			           
		           </div>
		           <div class="row">
		              <div class="col">
		              </div>
		              <div class="col col-lg-3">
		              </div>
		              <div class="col col-lg-1">
		                <button type="reset" class="btn btn-secondary float-right">Reset</button>
		              </div>
		              <div class="col col-lg-2">
		                <button type="button" data-toggle="modal" data-target="#proses_assesment" @click="tambahObjektif()" class="btn btn-success btn-block float-right">simpan</button>
		              </div>
		            </div>
		        </div>
		      </div>
    	 </div>
	</div>
</template>
<script>
/*eslint-disable*/
  import SidebarNav from '@/components/SidebarNav.vue'

export default {
	name : 'SOAP',
	components : {
		SidebarNav,
		"tags-input": VoerroTagsInput
	},
	data() {
		return {
			pasien_rekmed : [],
			subjektif : [],
			assesment : [],
			plan_diagnosis : [],
			plan_edukasi : [],
			plan_terapi : [],
			diagnosis : [],
			tindakan : [],
			tampil_subjektif : []
		}
	},
	created() {
		const getData = (x) => {
        let y = localStorage.getItem(x);
        return JSON.parse(y) || [];
      }
      console.log('subjektif', this.tampil_subjektif)
      this.pasien_rekmed = getData('pasien');

    },
    methods: {

    }
  }

</script>
<style>
  /*eslint-disable*/
  .card {
    border: 1px solid #eeeeee;
  }

  #card-racikan {
    border: 0.5px solid #bdbdbd !important;
    border-radius: 0.35rem !important;
  }

  .card-body {
    padding: 6px 12px;
  }

</style>
