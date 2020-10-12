<!-- eslint-disable -->
<template>
	<div class="racikan">
		<!-- Sidebar -->
    	<SidebarNav />
    	<!-- Page Content -->
    	<div id="content">
    		<h2 class="my-3 font-weight-bold">Form Racikan Resep Dokter</h2>
		      <div class="row">
		          <div class="col-4">
		            <router-link to="/riwayat_medis">
		              <div class="card border-left-danger shadow-none">
		                <div class="card-body">
		                  <div class="row no-gutters align-items-center">
		                    <div class="text-md font-weight-bold text-danger text-uppercase">{{ pasien_rekmed.nama }}</div>
		                  </div>
		                </div>
		              </div>
		            </router-link>
		          </div>

		          <div class="col-2">
		            <router-link to="/riwayat_medis">
		              <div class="card border-left-danger shadow-none">
		                <div class="card-body">
		                  <div class="row no-gutters align-items-center">
		                    <div class="text-md font-weight-bold text-danger text-uppercase">{{ pasien_rekmed.ID }}</div>
		                  </div>
		                </div>
		              </div>
		            </router-link>
		          </div>
		      </div>
		      <div class="card" v-for="(racikan, indexRacikan) in racikan" v-bind:key="indexRacikan">
		          <div class="card-body plan-card-kotak">
		            <div class="row">
		              <div class="col-md-12 mb-3">
		                <div class="card-header font-weight-bold bg-dark text-white">
		                	<div class="row">
		                		<div class="col-11">Racikan ({{ indexRacikan+1 }})</div>
		                		<div class="col-1">
		                    		<button type="button" @click="hapusRacikan(indexRacikan)" class="btn btn-danger"><i style="float: left;" class="fa fa-times"></i></button>
		                		</div>
		                	</div>
		                </div>
		                <div class="obat_scroll">
			                <div class="row my-3 mx-2" v-for="(obat, indexObat) in racikan_obat" v-bind:key="indexObat">
			                  <div class="col-6">
			                    <input type="text" class="form-control" v-model="obat.nama_obat" placeholder="Nama Obat">
			                  </div>
			                  <div class="col-5">
			                    <input type="text" class="form-control" v-model="obat.jumlah" placeholder="Jumlah">
			                  </div>
			                  <div class="col-1">
			                    <button type="button" @click="hapusObat(indexObat)" class="btn btn-danger"><i style="float: left;" class="fa fa-times"></i></button>
			                  </div>
			                </div>
		                </div>
		                <div class="row my-3">
		                  <div class="mx-auto">
		                    <button type="button" @click="tambahObat()" class="btn btn-success">Obat <i class="fa fa-plus-circle"></i></button>
		                  </div>
		                </div>
		                 <div class="row my-3 mx-2">
		                	<div class="col-6">
		                    	<input type="text" class="form-control" v-model="racikan.pulv" placeholder="M. F. Pulv">
		                	</div>
		                	<div class="col-5">
		                    	<input type="text" class="form-control" v-model="racikan.sigma" placeholder="Sigma">
		                	</div>
		                </div>
		              </div>
		            </div>
		          </div>
		      </div>
		      <div class="row my-3 mx-2">
		      	<div class="mx-auto">
		        	<button type="button" class="btn btn-success" @click="tambahRacikan()">Racikan <i class="fa fa-plus-circle"></i></button>
		      	</div>
		      </div>
    	</div>
	</div>
</template>
<script>
/*eslint-disable*/
import SidebarNav from '@/components/SidebarNav.vue'

export default {
	name : 'racikan',
	components : {
		SidebarNav,
	},
	data() {
		return {
			pasien_rekmed : [],
			racikan_obat : [{
				nama_obat : '',
				jumlah : ''
			}],
			racikan : [{
				pulv : '',
				sigma : ''
			}]
		}
	},
	async created() {
	    const getData = (x) => {
	      let y = localStorage.getItem(x);
	      return JSON.parse(y) || [];
	    }
	    this.pasien_rekmed = getData('pasien');
  	},
	methods : {
		tambahObat() { 
			this.racikan_obat.push({
				nama_obat : '',
				jumlah : ''
			})
		},
		tambahRacikan() { 
			this.racikan.push({
				pulv : '',
				sigma : ''
			})
		},
		hapusObat(indexObat) {
			this.racikan_obat.splice(indexObat,1);
		},
		hapusRacikan(indexRacikan) {
			this.racikan.splice(indexRacikan,1);
		}
	}
}
</script>
<style>
/*eslint-disable*/
.obat_scroll {
    overflow-y: scroll;
    height: 100px;
  }
</style>