<template>
<!-- eslint-disable	 -->
	<div class="SOAP">
		 <!-- Sidebar -->
    	 <SidebarNav/>

    	 <div id="content">
		      <div class="row mb-4">
		        <div class="col col-md-4">
		            <div class="card border-left-primary shadow-none">
		              <div class="card-body">
		                <div class="row no-gutters align-items-center">
		                  <div class="text-md font-weight-bold text-primary text-uppercase"> NAMA : {{ pasien_rekmed.nama}}</div>
		               </div>
		             </div>
		            </div>
		         </div>
		         <div class="col col-md-3">
		            <div class="card border-left-primary shadow-none">
		              <div class="card-body">
		                <div class="row no-gutters align-items-center">
		                 <div class="text-md font-weight-bold text-primary text-uppercase">ID PASIEN : {{ pasien_rekmed.ID }}</div>
		                </div>
		              </div>
		             </div>
		        </div>
		        <div class="col col-md-3">
		        	<button type="button" class="btn btn-sm btn-primary riwayat-medis" data-toggle="modal" data-target="#riwayatMedis">
                      Riwayat Medis
                    </button>
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
					           <div class="col-1">S</div>
						       <div class="col-11">
						   		    <tags-input v-model="input_subjektif"></tags-input>
						       </div>
					       </div>
				           <div class="row px-4">
				           		<div class="col-1">O</div>
				           		<div class="col-11">
				           		  <div class="form-row">
						            <div class="col-md-6">
						              <div class="input-group mb-3">
						                <input type="text" class="form-control" v-model="input_objektif.nadi" placeholder="N">
						                <div class="input-group-append">
						                  <span class="input-group-text" id="basic-addon2">x/min</span>
						                </div>  
						              </div>
						            </div>
						            <div class="col-md-6">
						              <div class="input-group mb-3">
						                <input type="text" class="form-control" v-model="input_objektif.tekanan_darah" placeholder="TD">
						                <div class="input-group-append">
						                  <span class="input-group-text" id="basic-addon2">mmHg</span>
						                </div> 
						              </div>
						            </div>
						          </div>
						          <div class="form-row my-3">
						          	<div class="col-md-6">
						              <div class="input-group mb-3">
						                <input type="text" class="form-control" v-model="input_objektif.suhu_tubuh" placeholder="ST">
						                <div class="input-group-append">
						                  <span class="input-group-text" id="basic-addon2">°C</span>
						                </div> 
						              </div>
						            </div>
						            <div class="col-md-6">
						              <div class="input-group mb-3">
						                <input type="text" class="form-control" v-model="input_objektif.respirator_rate" placeholder="RR">
						                <div class="input-group-append">
						                  <span class="input-group-text" id="basic-addon2">x/min</span>
						                </div>
						              </div>
						            </div>
						          </div>
						          <div class="form-row">
						          	<div class="col-md-6">
						              <div class="input-group mb-3">
						                <input type="text" class="form-control" v-model="input_objektif.berat_badan" placeholder="BB">
						                <div class="input-group-append">
						                  <span class="input-group-text" id="basic-addon2">kg</span>
						                </div>
						              </div>
						            </div>
						            <div class="col-md-6">
						              <div class="input-group mb-3">
						                <input type="text" class="form-control" v-model="input_objektif.tinggi_badan" placeholder="TB">
						                <div class="input-group-append">
						                  <span class="input-group-text" id="basic-addon2">cm</span>
						                </div>
						              </div>
						            </div>
						          </div>
						          <div class="form-row">
						            <div class="form-group col-md-12">
						              <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" v-model="input_objektif.hasil_pemeriksaan" placeholder="Hasil Pemeriksaan"></textarea>
						            </div>
						          </div>
				           		</div>
				           </div>
				           <div class="row px-4 mb-4">
				           		<div class="col-1">A</div>
				           		<div class="col-11">
						   		    <tags-input v-model="input_assesmen" :existing-tags="cari_asessment" :typeahead="true" :typeahead-style="typeaheadStyle" :typeahead-show-on-focus="true"></tags-input>
				           		</div>
				           </div>
		           		</div>
		           		<div class="col-6">
				           <div class="row p-4">
				           	   <div class="col-1">P</div>
						       <div class="col-11">
						       		<div class="row">
						       			<div class="col">
								   	    	<tags-input v-model="input_plan_diagnostik" placeholder="plan diagnostik" :existing-tags=" cari_plan_diagnostik" :typeahead="true" :typeahead-style="typeaheadStyle" :typeahead-show-on-focus="true"></tags-input>
						       			</div>
						       		</div>
						       		<div class="row my-4">
						       			<div class="col">
								   	    	<tags-input v-model="input_plan_terapi" placeholder="plan terapi"></tags-input>
						       			</div>
						       		</div>
						       		<div class="row">
						       			<div class="col">
								   	    	<tags-input v-model="input_plan_edukasi" placeholder="plan edukasi" :existing-tags=" cari_plan_edukasi" :typeahead="true" :typeahead-style="typeaheadStyle" :typeahead-show-on-focus="true"></tags-input>
						       			</div>
						       		</div>
						       </div>
				           </div>
		           			<div class="row px-4">
					           <div class="col-1">D</div>
						       <div class="col-11">
						   		    <tags-input v-model="input_diagnosis"></tags-input>
						       </div>
					       </div>
					       <div class="row p-4">
					           <div class="col-1">T</div>
						       <div class="col-11">
						   		    <tags-input v-model="input_tindakan"></tags-input>
						       </div>
					       </div>
		           		</div>
		           	</div>
			           
		           </div>
		           <div class="row my-3">
		              <div class="col col-lg-5">
		              </div>
		              <div class="col col-lg-3">
		              </div>
		              <div class="col col-lg-3">
		                <button type="button" @click="SimpanDenganResep()" class="btn btn-success btn-block float-right">Tambah Resep</button>
		              </div>
		              <div class="col col-lg-1">
		              <button type="button" class="btn btn-info float-right" data-toggle="modal" data-target="#selesai">Selesai</button>
		              </div>
		            </div>
		        </div>
		      </div>
		      <!-- Modal Proses -->
		      <div class="modal fade" id="selesai" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		        <div class="modal-dialog modal-dialog-centered" role="document">
		          <div class="modal-content">
		            <div class="modal-header">
		              <h5 class="modal-title font-weight-bold" id="exampleModalLongTitle">Proses selesai</h5>
		              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                <span aria-hidden="true">&times;</span>
		              </button>
		            </div>
		            <div class="modal-body text-dark">
		              Lanjutkan tanpa resep ?
		            </div>
		            <div class="modal-footer">
		              <button type="button" data-dismiss="modal" @click="SimpanTanpaResep()" class="btn btn-secondary">Ya</button>
		              <button type="button" class="btn btn-info" @click="SimpanDenganResep()" data-dismiss="modal">Tidak</button>
		            </div>
		          </div>
		        </div>
		      </div>
		      <!-- Modal Riwayat Medis -->
	          <div class="modal fade" id="riwayatMedis" tabindex="-1" aria-labelledby="exampleModalLabel"
	            aria-hidden="true">
	            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
	              style="max-width: 100% !important; width: 90% !important;">
	              <div class="modal-content">
	                <div class="modal-header">
	                  <h5 class="modal-title" id="exampleModalLabel">Riawayat Medis</h5>
	                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                    <span aria-hidden="true">&times;</span>
	                  </button>
	                </div>
	                <div class="modal-body">
	                	<table class="table table-hover table-bordered">
				        <thead>
				          <tr class="text-center bg-dark" style="color: white;">
				            <th scope="col">Tanggal</th>
				            <th scope="col">Objektif</th>
				            <th scope="col">Asesmen</th>
				            <th scope="col">Rencana</th>
				            <th scope="col">Resep</th>
				            <th scope="col">Detail</th>
				          </tr>
				        </thead>
				        <!-- <tbody>
				            <tr v-for="(row, index) in list_riwayat" :key="index">
				              <th scope="row" class="text-center">{{ row.tanggal_periksa }}</th>
				              <td>{{ row.objektif }}</td>
				              <td>{{ row.asesmen }}</td>
				              <td>{{ row.rencana }}</td>
				              <td>{{ row.resep }}</td>
				            </tr>
				          </tbody> -->
				        <tbody>
				          <tr>
				            <th scope="row">01 September</th>
				            <td class="text-center">Objektif 1</td>
				            <td class="text-center">Assesment 1</td>
				            <td>Rencana 1</td>
				            <td>Resep 1</td>
				            <td class="text-center">
				              <button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#riwayatModal">
				                Detail Resep
				              </button>
				            </td>
				          </tr>
				          <tr>
				            <th scope="row">02 November</th>
				            <td class="text-center">Objektif 2</td>
				            <td class="text-center">Assesment 2</td>
				            <td>Rencana 2</td>
				            <td>Resep 2</td>
				            <td class="text-center">
				              <button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#riwayatModal">
				                Detail Resep
				              </button>
				            </td>
				          </tr>

				          <!-- Modal Riwayat Medis -->
				          <div class="modal fade" id="riwayatModal" tabindex="-1" aria-labelledby="exampleModalLabel"
				            aria-hidden="true">
				            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
				              style="max-width: 100% !important; width: 90% !important;">
				              <div class="modal-content">
				                <div class="modal-header">
				                  <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
				                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				                    <span aria-hidden="true">&times;</span>
				                  </button>
				                </div>
				                <div class="modal-body">

				                  <div class="row">
				                    <div class="col-md-6">
				                      <div>
				                        <table class="table table-sm table-borderless">
				                          <tbody>
				                            <tr>
				                              <th>Nama</th>
				                              <td>: Shofian Listya</td>
				                            </tr>
				                            <tr>
				                              <th>Nomor Rekam Medis</th>
				                              <td>: RM0004</td>
				                            </tr>
				                            <tr>
				                              <th>Status BPJS</th>
				                              <td>: Tidak</td>
				                            </tr>
				                            <tr>
				                              <th>Tanggal</th>
				                              <td>: 24 Oktober 2020</td>
				                            </tr>
				                          </tbody>
				                        </table>
				                      </div>
				                      <div>
				                        <div class="card">
				                          <ul class="list-group">
				                            <li class="list-group-item font-weight-bold text-center">Subjektif</li>
				                            <div class="px-5" v-for="(sub, index) in subjektif" v-bind:key="index">
				                              <span>{{ index+1 }}. {{ sub.subjective }}</span><br>
				                            </div>
				                            <li class="list-group-item font-weight-bold text-center">Objektif</li>
				                            <div class="px-5 my-2" v-for="(obj, index) in objektif" v-bind:key="index">
				                              <span> Nadi : {{ obj.nadi }}</span><br>
				                              <span> Tekanan Darah : {{ obj.tekanan_darah }}</span><br>
				                              <span> Suhu Tubuh : {{ obj.suhu_tubuh }}</span><br>
				                              <span> Respirator Rate : {{ obj.respirator_rate }}</span><br>
				                              <span> Berat Badan : {{ obj.berat_badan }}</span><br>
				                              <span> Tinggi Badan : {{ obj.tinggi_badan }}</span><br>
				                              <span> Hasil Pemeriksaan : {{ obj.hasil_pemeriksaan }}</span>
				                            </div>
				                            <li class="list-group-item font-weight-bold text-center">Assesment</li>
				                            <div class="px-5" v-for="(ass, index) in assesment" v-bind:key="index">
				                              <span>{{ index+1 }}. {{ ass.nama_diagnosis }}</span><br>
				                            </div>
				                            <li class="list-group-item font-weight-bold text-center">Planning</li>
				                            <li class="list-group-item">Rencana Diagnostik</li>
				                            <div class="px-5" v-for="(diag, index) in plan_diagnosis" v-bind:key="index">
				                              <span>{{ index+1 }}. {{ diag.nama_diagnosis }}</span><br>
				                            </div>
				                            <li class="list-group-item">Rencana Terapi</li>
				                            <li class="list-group-item">Rencana Edukasi</li>
				                            <!-- <li class="list-group-item font-weight-bold text-center">Resep</li>
				                            <li class="list-group-item">ALorem Ipsum</li>
				                            <li class="list-group-item font-weight-bold text-center">Total Pembayaran</li>
				                            <li class="list-group-item">ALorem Ipsum</li> -->
				                          </ul>
				                        </div>
				                      </div>
				                    </div>
				                    <div class="col-md-6" id="invoice-payment">
				                      <div>
				                        <p class="h4 font-weight-bold text-center">Klink Citra Medika</p>
				                        <hr>
				                      </div>
				                      <div>
				                        <table class="table table-sm table-borderless">
				                          <tbody>
				                            <tr>
				                              <th>Nama</th>
				                              <td>: Shofian Carono</td>
				                            </tr>
				                            <tr>
				                              <th>Nomor Rekam Medis</th>
				                              <td>: RM0004</td>
				                            </tr>
				                          </tbody>
				                        </table>
				                        <hr>
				                      </div>

				                      <div>
				                        <div class="h6 font-weight-bold text-center">Resep</div>
				                        <hr>
				                      </div>

				                      <div>
				                        <div class="h6 font-weight-bold text-center">Pembayaran</div>
				                        <hr>
				                      </div>

				                    </div>
				                  </div>

				                </div>
				                <div class="modal-footer">
				                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				                  <button type="button" class="btn btn-primary" onclick="window.print();">Cetak invoice</button>
				                </div>
				              </div>
				            </div>
				          </div>
				        </tbody>
				      </table>
	                </div>
	                <!-- <div class="modal-footer">
	                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	                  <button type="button" class="btn btn-primary" onclick="window.print();">Cetak invoice</button>
	                </div> -->
	              </div>
	            </div>
	          </div>
	          <!-- Modal Riwayat Medis -->
	          <div class="modal fade" id="riwayatModal" tabindex="-1" aria-labelledby="exampleModalLabel"
	            aria-hidden="true">
	            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
	              style="max-width: 100% !important; width: 90% !important;">
	              <div class="modal-content">
	                <div class="modal-header">
	                  <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
	                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                    <span aria-hidden="true">&times;</span>
	                  </button>
	                </div>
	                <div class="modal-body">

	                  <div class="row">
	                    <div class="col-md-6">
	                      <div>
	                        <table class="table table-sm table-borderless">
	                          <tbody>
	                            <tr>
	                              <th>Nama</th>
	                              <td>: Shofian Listya</td>
	                            </tr>
	                            <tr>
	                              <th>Nomor Rekam Medis</th>
	                              <td>: RM0004</td>
	                            </tr>
	                            <tr>
	                              <th>Status BPJS</th>
	                              <td>: Tidak</td>
	                            </tr>
	                            <tr>
	                              <th>Tanggal</th>
	                              <td>: 24 Oktober 2020</td>
	                            </tr>
	                          </tbody>
	                        </table>
	                      </div>
	                      <div>
	                        <div class="card">
	                          <ul class="list-group">
	                            <li class="list-group-item font-weight-bold text-center">Subjektif</li>
	                            <div class="px-5" v-for="(sub, index) in subjektif" v-bind:key="index">
	                              <span>{{ index+1 }}. {{ sub.subjective }}</span><br>
	                            </div>
	                            <li class="list-group-item font-weight-bold text-center">Objektif</li>
	                            <div class="px-5 my-2" v-for="(obj, index) in objektif" v-bind:key="index">
	                              <span> Nadi : {{ obj.nadi }}</span><br>
	                              <span> Tekanan Darah : {{ obj.tekanan_darah }}</span><br>
	                              <span> Suhu Tubuh : {{ obj.suhu_tubuh }}</span><br>
	                              <span> Respirator Rate : {{ obj.respirator_rate }}</span><br>
	                              <span> Berat Badan : {{ obj.berat_badan }}</span><br>
	                              <span> Tinggi Badan : {{ obj.tinggi_badan }}</span><br>
	                              <span> Hasil Pemeriksaan : {{ obj.hasil_pemeriksaan }}</span>
	                            </div>
	                            <li class="list-group-item font-weight-bold text-center">Assesment</li>
	                            <div class="px-5" v-for="(ass, index) in assesment" v-bind:key="index">
	                              <span>{{ index+1 }}. {{ ass.nama_diagnosis }}</span><br>
	                            </div>
	                            <li class="list-group-item font-weight-bold text-center">Planning</li>
	                            <li class="list-group-item">Rencana Diagnostik</li>
	                            <div class="px-5" v-for="(diag, index) in plan_diagnosis" v-bind:key="index">
	                              <span>{{ index+1 }}. {{ diag.nama_diagnosis }}</span><br>
	                            </div>
	                            <li class="list-group-item">Rencana Terapi</li>
	                            <li class="list-group-item">Rencana Edukasi</li>
	                            <!-- <li class="list-group-item font-weight-bold text-center">Resep</li>
	                            <li class="list-group-item">ALorem Ipsum</li>
	                            <li class="list-group-item font-weight-bold text-center">Total Pembayaran</li>
	                            <li class="list-group-item">ALorem Ipsum</li> -->
	                          </ul>
	                        </div>
	                      </div>
	                    </div>
	                    <div class="col-md-6" id="invoice-payment">
	                      <div>
	                        <p class="h4 font-weight-bold text-center">Klink Citra Medika</p>
	                        <hr>
	                      </div>
	                      <div>
	                        <table class="table table-sm table-borderless">
	                          <tbody>
	                            <tr>
	                              <th>Nama</th>
	                              <td>: Shofian Carono</td>
	                            </tr>
	                            <tr>
	                              <th>Nomor Rekam Medis</th>
	                              <td>: RM0004</td>
	                            </tr>
	                          </tbody>
	                        </table>
	                        <hr>
	                      </div>

	                      <div>
	                        <div class="h6 font-weight-bold text-center">Resep</div>
	                        <hr>
	                      </div>

	                      <div>
	                        <div class="h6 font-weight-bold text-center">Pembayaran</div>
	                        <hr>
	                      </div>

	                    </div>
	                  </div>

	                </div>
	                <div class="modal-footer">
	                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	                  <button type="button" class="btn btn-primary" onclick="window.print();">Cetak invoice</button>
	                </div>
	              </div>
	            </div>
	          </div>
    	 </div>
	</div>
</template>
<script>
/*eslint-disable*/
import VoerroTagsInput from '@voerro/vue-tagsinput'
import SidebarNav from '@/components/SidebarNav.vue'
import axios from 'axios'

export default {
	name : 'SOAP',
	components : {
		SidebarNav,
		VoerroTagsInput,
	},
	data() {
		return {
			typeahead: true,
            typeaheadStyle: 'dropdown',
            typeaheadShowOnFocus: true,
            cari_asessment : [],
            cari_plan_diagnostik : [],
            cari_plan_edukasi : [],
			pasien_rekmed : [],
		    subjektif : [],
			objektif : [],
			assesmen : [],
			plan_diagnostik : [],
			plan_edukasi : [],
			plan_terapi : [],
			diagnosis : [],
			tindakan : [],
			input_subjektif : [],
			input_objektif: {
		        nadi : '',
		        tekanan_darah : '',
		        suhu_tubuh : '',
		        respirator_rate : '',
		        berat_badan : '',
		        tinggi_badan : '',
		        hasil_pemeriksaan : ''
		      },
		    input_assesmen : [],
			input_plan_diagnostik : [],
			input_plan_edukasi : [],
			input_plan_terapi : [],
			input_diagnosis : [],
			input_tindakan : [],
			

		}
	},
	async created() {
		//localStorage.clear();
		const getData = (x) => {
        let y = localStorage.getItem(x);
        return JSON.parse(y) || [];
      }
      //console.log('subjektif', this.subjektif)
      this.pasien_rekmed = getData('pasien');
      this.cari_asessment = await this.tampilAssesment()
      this.cari_plan_diagnostik = await this.tampilPlanDiagnostik()
      this.cari_plan_edukasi = await this.tampilPlanEdukasi()
    
      /*console.log('pasien', this.pasien_rekmed)
      console.log('ass', this.cari_asessment)
      console.log('pd', this.cari_plan_diagnostik)*/

	},
	methods : {
		async tampilAssesment() {
			return await axios.get('http://localhost/rekmed-server/api/v1/Assesment/get').then(res => res.data)

	    },
	    async tampilPlanDiagnostik() {
	    	return await axios.get('http://localhost/rekmed-server/api/v1/Plan_diagnosis/get').then(res => res.data)
	    },
	    async tampilPlanEdukasi() {
	    	return await axios.get('http://localhost/rekmed-server/api/v1/Plan_edukasi/get').then(res => res.data)
	    },
		async tambahDataSemua() {
			//subjektif
			for (var i = this.input_subjektif.length - 1; i >= 0; i--) {
				//let a = this.subjektif[i].value
				let temp_subjektif = {
					'ID' : this.input_subjektif[i].ID,
					'ID_pasien' : this.pasien_rekmed.ID,
					'nama' : this.input_subjektif[i].value
				}
				
				this.subjektif.push(temp_subjektif)
			}
			this.$store.dispatch('tambahDataSubjective', this.subjektif);
	        localStorage.setItem('subjective', JSON.stringify(this.subjektif));
			console.log('subjektif',this.subjektif)

			//objektif
			let temp_objektif = {
	        //'id_pasien' : this.pasien_rekmed.ID,
	        'nadi' : this.input_objektif.nadi,
	        'tekanan_darah' : this.input_objektif.tekanan_darah,
	        'suhu_tubuh' : this.input_objektif.suhu_tubuh,
	        'respirator_rate' : this.input_objektif.respirator_rate,
	        'berat_badan' : this.input_objektif.berat_badan,
	        'tinggi_badan' : this.input_objektif.tinggi_badan,
	        'hasil_pemeriksaan' : this.input_objektif.hasil_pemeriksaan
	      	};

	      	this.objektif.push(temp_objektif)
	      	this.$store.dispatch('tambahDataObjective', this.objektif);
      		localStorage.setItem('objektive', JSON.stringify(this.objektif));
      		console.log('objektif', this.objektif)

      		//assesmen
      		for (var i = this.input_assesmen.length - 1; i >= 0; i--) {
      			let temp_assesmen = {
      				'ID' : this.input_assesmen[i].ID,
      				'ID_pasien' : this.pasien_rekmed.ID,
      				'nama_diagnosis' : this.input_assesmen[i].value
      			}
      			this.assesmen.push(temp_assesmen)

          		
      		}
      		this.$store.dispatch('tambahDataAssesment', this.assesmen);
        	localStorage.setItem('assesment', JSON.stringify(this.assesmen));
      		console.log('assesment',this.assesmen)
          		//post api
          		//const res = await axios.post('http://localhost/rekmed-server/api/v1/Assesment/post',t).then(res => res.data.assesment)
				//console.log('assesment',[this.a])

			//plan diagnosis
			for (var i = this.input_plan_diagnostik.length - 1; i >= 0; i--) {
				let temp_plan_diag = {
					'ID' : this.input_plan_diagnostik[i].ID,
					'ID_pasien' : this.pasien_rekmed.ID,
					'nama_diagnosis' : this.input_plan_diagnostik[i].value
				}
				this.plan_diagnostik.push(temp_plan_diag)
			}
			this.$store.dispatch('tambahDataPlanDiagnosis', this.plan_diagnostik);
          	localStorage.setItem('plan_diagnosis', JSON.stringify(this.plan_diagnostik));
			console.log('plan_diagnostik',this.plan_diagnostik)

			//plan terapi
			for (var i = this.input_plan_terapi.length - 1; i >= 0; i--) {
				let temp_plan_te = {
					'ID' : this.input_plan_terapi[i].ID,
					'ID_pasien' : this.pasien_rekmed.ID,
					'nama_terapi' : this.input_plan_terapi[i].value
				}
				this.plan_terapi.push(temp_plan_te)
			}
			this.$store.dispatch('tambahDataPlanTerapi', this.plan_terapi);
          	localStorage.setItem('plan_terapi', JSON.stringify(this.plan_terapi));
			console.log('plan_terapi',this.plan_terapi)

			//plan edukasi
			for (var i = this.input_plan_edukasi.length - 1; i >= 0; i--) {
				let temp_plan_edu = {
					'ID' : this.input_plan_edukasi[i].ID,
					'ID_pasien' : this.pasien_rekmed.ID,
					'nama_edukasi' : this.input_plan_edukasi[i].value
				}
				this.plan_edukasi.push(temp_plan_edu)
			}
			this.$store.dispatch('tambahDataPlanEdukasi', this.plan_edukasi);
          	localStorage.setItem('plan_edukasi', JSON.stringify(this.plan_edukasi));
			console.log('plan_edukasi',this.plan_edukasi)

			//diagnosis
			for (var i = this.input_diagnosis.length - 1; i >= 0; i--) {
				let temp_diagnosis = {
					'ID' : this.input_diagnosis[i].ID,
					'ID_pasien' : this.pasien_rekmed.ID,
					'nama' : this.input_diagnosis[i].value
				}
				this.diagnosis.push(temp_diagnosis)
			}
			this.$store.dispatch('tambahDataDiagnosis', this.diagnosis);
          	localStorage.setItem('diagnosis', JSON.stringify(this.diagnosis));
			console.log('diagnosis',this.diagnosis)

			//tindakan
			for (var i = this.input_tindakan.length - 1; i >= 0; i--) {
				let temp_tindakan = {
					'ID' : this.input_tindakan[i].ID,
					'ID_pasien' : this.pasien_rekmed.ID,
					'nama_tindakan' : this.input_tindakan[i].value
				}
				this.tindakan.push(temp_tindakan)
			}
			this.$store.dispatch('tambahDataTindakan', this.tindakan);
          	localStorage.setItem('tindakan', JSON.stringify(this.tindakan));
			console.log('tindakan',this.tindakan)
		},
		SimpanTanpaResep() {
			this.tambahDataSemua()
			this.$router.push('/invoice')
		},
		SimpanDenganResep() {
			this.tambahDataSemua()
			this.$router.push('/obat')
		},
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
  .riwayat-medis {
  	height: 37px;
    padding: 6px 12px;

  }
</style>