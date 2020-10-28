<template>
  <!-- eslint-disable	 -->
  <div class="SOAP">
    <!-- Sidebar -->
    <SidebarNav />

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
                <div class="text-md font-weight-bold text-primary text-uppercase">ID PASIEN : {{ pasien_rekmed.ID }}
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col col-md-3">
          <button type="button" class="btn btn-sm btn-primary riwayat-medis" data-toggle="modal"
            data-target="#riwayatMedis">
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
          <form @submit.prevent="Simpan">
          <div class="card my-3">
            <div class="row">
              <div class="col-6">
                <div class="form-row p-4">
                  <div class="col-1">S</div>
                  <div class="form-group col-11">
                    <tags-input v-model.trim="$v.input_subjektif.$model" :class="{'is-invalid' : $v.input_subjektif.$error, 'is-valid' : !$v.input_subjektif.$invalid}"></tags-input>
                    <div class="valid-feedback">Subjektif Sudah!</div>
                    <div class="invalid-feedback">
                      <span v-if="!$v.input_subjektif.required">Subjektif Tidak Boleh Kosong </span>
                    </div>
                  </div>
                </div>
                <div class="form-row px-4">
                  <div class="col-1">O</div>
                  <div class="col-11">
                    <div class="form-row">
                      <div class="col-md-6">
                        <div class="input-group mb-3">
                          <input type="text" class="form-control" v-model.trim="$v.nadi.$model" placeholder="N" :class="{'is-invalid' : $v.nadi.$error, 'is-valid' : !$v.nadi.$invalid}">
                          <div class="input-group-append">
                            <span class="input-group-text" id="basic-addon2">x/min</span>
                          </div>
                          <div class="valid-feedback">Nadi Sudah!</div>
                          <div class="invalid-feedback">
                            <span v-if="!$v.nadi.required">Nadi Tidak Boleh Kosong </span>
                            <span v-if="!$v.nadi.numeric">Nadi Harus Angka </span>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="input-group mb-3">
                          <input type="text" class="form-control" v-model.trim="$v.tekanan_darah.$model"
                            placeholder="TD" :class="{'is-invalid' : $v.tekanan_darah.$error, 'is-valid' : !$v.tekanan_darah.$invalid}">
                          <div class="input-group-append">
                            <span class="input-group-text" id="basic-addon2">mmHg</span>
                          </div>
                          <div class="valid-feedback">Tekanan Darah Sudah!</div>
                          <div class="invalid-feedback">
                            <span v-if="!$v.tekanan_darah.required">Tekanan Darah Tidak Boleh Kosong </span>
                            <span v-if="!$v.tekanan_darah.per">Tekanan Darah Harus Angka </span>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="form-row my-3">
                      <div class="col-md-6">
                        <div class="input-group mb-3">
                          <input type="text" class="form-control" v-model.trim="$v.suhu_tubuh.$model" placeholder="ST" :class="{'is-invalid' : $v.suhu_tubuh.$error, 'is-valid' : !$v.suhu_tubuh.$invalid}">
                          <div class="input-group-append">
                            <span class="input-group-text" id="basic-addon2">°C</span>
                          </div>
                          <div class="valid-feedback">Suhu Tubuh Sudah!</div>
                          <div class="invalid-feedback">
                            <span v-if="!$v.suhu_tubuh.required">Suhu Tubuh Tidak Boleh Kosong</span>
                            <span v-if="!$v.suhu_tubuh.koma">Suhu Tubuh Harus Angka</span>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="input-group mb-3">
                          <input type="text" class="form-control" v-model.trim="$v.respirator_rate.$model"
                            placeholder="RR" :class="{'is-invalid' : $v.respirator_rate.$error, 'is-valid' : !$v.respirator_rate.$invalid}">
                          <div class="input-group-append">
                            <span class="input-group-text" id="basic-addon2">x/min</span>
                          </div>
                          <div class="valid-feedback">Respirator Rate Sudah!</div>
                          <div class="invalid-feedback">
                            <span v-if="!$v.respirator_rate.required">Respirator Rate Tidak Boleh Kosong </span>
                            <span v-if="!$v.respirator_rate.numeric">Respirator Rate Harus Angka </span>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="form-row">
                      <div class="col-md-6">
                        <div class="input-group mb-3">
                          <input type="text" class="form-control" v-model.trim="$v.berat_badan.$model" placeholder="BB" :class="{'is-invalid' : $v.berat_badan.$error, 'is-valid' : !$v.berat_badan.$invalid}">
                          <div class="input-group-append">
                            <span class="input-group-text" id="basic-addon2">kg</span>
                          </div>
                          <div class="valid-feedback">Berat Badan Sudah!</div>
                          <div class="invalid-feedback">
                            <span v-if="!$v.berat_badan.required">Berat Badan Tidak Boleh Kosong </span>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="input-group mb-3">
                          <input type="text" class="form-control" v-model.trim="$v.tinggi_badan.$model"
                            placeholder="TB" :class="{'is-invalid' : $v.tinggi_badan.$error, 'is-valid' : !$v.tinggi_badan.$invalid}">
                          <div class="input-group-append">
                            <span class="input-group-text" id="basic-addon2">cm</span>
                          </div>
                          <div class="valid-feedback">Tinggi Badan Sudah!</div>
                          <div class="invalid-feedback">
                            <span v-if="!$v.tinggi_badan.required">Tinggi Badan Tidak Boleh Kosong </span>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="form-row">
                      <div class="form-group col-md-12">
                        <textarea class="form-control" rows="3"
                          v-model.trim="$v.hasil_pemeriksaan.$model" placeholder="Hasil Pemeriksaan" :class="{'is-invalid' : $v.hasil_pemeriksaan.$error, 'is-valid' : !$v.hasil_pemeriksaan.$invalid}"></textarea>
                        <div class="valid-feedback">Hasil Pemeriksaan Sudah!</div>
                        <div class="invalid-feedback">
                          <span v-if="!$v.hasil_pemeriksaan.required">Hasil Pemeriksaan Tidak Boleh Kosong </span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="form-row px-4 mb-4">
                  <div class="col-1">A</div>
                  <div class="form-group col-11">
                    <tags-input v-model="input_assesmen" :existing-tags="cari_asessment" :typeahead="true"
                      :typeahead-style="typeaheadStyle" :typeahead-show-on-focus="true" ></tags-input>
                  </div>
                </div>
              </div>
              <div class="col-6">
                <div class="form-row p-4">
                  <div class="col-1">P</div>
                  <div class="col-11">
                    <div class="form-row">
                      <div class="form-group col">
                        <tags-input v-model.trim="$v.input_plan_diagnostik.$model" placeholder="plan diagnostik"
                          :existing-tags=" cari_plan_diagnostik" :typeahead="true" :typeahead-style="typeaheadStyle"
                          :typeahead-show-on-focus="true" :class="{'is-invalid' : $v.input_plan_diagnostik.$error, 'is-valid' : !$v.input_plan_diagnostik.$invalid}"></tags-input>
                        <div class="valid-feedback">Plan Diagnostik Sudah!</div>
                        <div class="invalid-feedback">
                          <span v-if="!$v.input_plan_diagnostik.required">Plan Diagnostik Tidak Boleh Kosong </span>
                        </div>
                      </div>
                    </div>
                    <div class="form-row my-4">
                      <div class="form-group col">
                        <tags-input v-model.trim="$v.input_plan_terapi.$model" placeholder="plan terapi" :class="{'is-invalid' : $v.input_plan_terapi.$error, 'is-valid' : !$v.input_plan_terapi.$invalid}"></tags-input>
                        <div class="valid-feedback">Plan Terapi Sudah!</div>
                        <div class="invalid-feedback">
                          <span v-if="!$v.input_plan_terapi.required">Plan Terapi Tidak Boleh Kosong </span>
                        </div>
                      </div>
                    </div>
                    <div class="form-row">
                      <div class="form-group col">
                        <tags-input v-model.trim="$v.input_plan_edukasi.$model" placeholder="plan edukasi"
                          :existing-tags=" cari_plan_edukasi" :typeahead="true" :typeahead-style="typeaheadStyle"
                          :typeahead-show-on-focus="true" :class="{'is-invalid' : $v.input_plan_edukasi.$error, 'is-valid' : !$v.input_plan_edukasi.$invalid}"></tags-input>
                        <div class="valid-feedback">Plan Edukasi Sudah!</div>
                        <div class="invalid-feedback">
                          <span v-if="!$v.input_plan_edukasi.required">Plan Edukasi Tidak Boleh Kosong </span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="form-row px-4">
                  <div class="col-1">D</div>
                  <div class="form-group col-11">
                    <tags-input v-model.trim="$v.input_diagnosis.$model" :class="{'is-invalid' : $v.input_diagnosis.$error, 'is-valid' : !$v.input_diagnosis.$invalid}"></tags-input>
                    <div class="valid-feedback">Diagnosis Sudah!</div>
                    <div class="invalid-feedback">
                      <span v-if="!$v.input_diagnosis.required">Diagnosis Tidak Boleh Kosong </span>
                    </div>
                  </div>
                </div>
                <div class="form-row p-4">
                  <div class="col-1">T</div>
                  <div class="form-group col-11">
                    <tags-input v-model.trim="$v.input_tindakan.$model" :class="{'is-invalid' : $v.input_tindakan.$error, 'is-valid' : !$v.input_tindakan.$invalid}"></tags-input>
                    <div class="valid-feedback">Tindakan Sudah!</div>
                    <div class="invalid-feedback">
                      <span v-if="!$v.input_tindakan.required">Tindakan Tidak Boleh Kosong </span>
                    </div>
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
            </div>
            <div class="col col-lg-1">
              <button type="submit" class="btn btn-info float-right">Selesai</button>
            </div>
          </div>
        </form>
        </div>
      </div>
      <!-- Modal Proses -->
      <div class="modal fade" id="selesai" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title font-weight-bold" id="exampleModalLongTitle">Proses selesai</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body text-dark">
              Lanjutkan dengan resep ?
            </div>
            <div class="modal-footer">
              <router-link to="/obat"><button type="button" data-dismiss="modal"
                class="btn btn-secondary">Ya</button></router-link>
              <router-link to="/invoice"><button type="button" class="btn btn-info"
                data-dismiss="modal">Tidak</button></router-link>
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
  import { required, minLength, maxLength, numeric, alpha, helpers } from 'vuelidate/lib/validators'
  import axios from 'axios'

  export default {
    name: 'SOAP',
    components: {
      SidebarNav,
      VoerroTagsInput,
    },
    data() {
      return {
        typeahead: true,
        typeaheadStyle: 'dropdown',
        typeaheadShowOnFocus: true,
        cari_asessment: [],
        cari_plan_diagnostik: [],
        cari_plan_edukasi: [],
        pasien_rekmed: [],
        subjektif: [],
        objektif: [],
        assesmen: [],
        plan_diagnostik: [],
        plan_edukasi: [],
        plan_terapi: [],
        diagnosis: [],
        tindakan: [],
        input_subjektif: [],
        nadi: '',
        tekanan_darah: '',
        suhu_tubuh: '',
        respirator_rate: '',
        berat_badan: '',
        tinggi_badan: '',
        hasil_pemeriksaan: '',
        input_assesmen: [],
        input_plan_diagnostik: [],
        input_plan_edukasi: [],
        input_plan_terapi: [],
        input_diagnosis: [],
        input_tindakan: [],
        submit_status : null

      }
    },
    validations : {
      input_subjektif : {
        required
      },
      input_tindakan : {
        required
      },
      input_diagnosis : {
        required
      },
      input_plan_terapi : {
        required
      },
      input_plan_edukasi : {
        required
      },
      input_plan_diagnostik : {
        required
      },
      nadi : {
        required,
        numeric
      },
      tekanan_darah : {
        required,
        per: helpers.regex('per',/^[0-9 /]*$/)
      },
      suhu_tubuh : {
        required,
        koma : helpers.regex('koma',/^[0-9\t\n ,]*$/)
      },
      respirator_rate : {
        required,
        numeric
      },
      berat_badan : {
        required
      },
      tinggi_badan : {
        required
      },
      hasil_pemeriksaan : {
        required
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
    methods: {
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
            'ID': this.input_subjektif[i].ID,
            'ID_pasien': this.pasien_rekmed.ID,
            'nama': this.input_subjektif[i].value
          }

          this.subjektif.push(temp_subjektif)
        }
        this.$store.dispatch('tambahDataSubjective', this.subjektif);
        localStorage.setItem('subjective', JSON.stringify(this.subjektif));
        console.log('subjektif', this.subjektif)

        //objektif
        let temp_objektif = {
          //'id_pasien' : this.pasien_rekmed.ID,
          'nadi': this.nadi,
          'tekanan_darah': this.tekanan_darah,
          'suhu_tubuh': this.suhu_tubuh,
          'respirator_rate': this.respirator_rate,
          'berat_badan': this.berat_badan,
          'tinggi_badan': this.tinggi_badan,
          'hasil_pemeriksaan': this.hasil_pemeriksaan
        };

        this.objektif.push(temp_objektif)
        this.$store.dispatch('tambahDataObjective', this.objektif);
        localStorage.setItem('objektive', JSON.stringify(this.objektif));
        console.log('objektif', this.objektif)

        //assesmen
        for (var i = this.input_assesmen.length - 1; i >= 0; i--) {
          let temp_assesmen = {
            'ID': this.input_assesmen[i].ID,
            'ID_pasien': this.pasien_rekmed.ID,
            'nama_diagnosis': this.input_assesmen[i].value
          }
          this.assesmen.push(temp_assesmen)


        }
        this.$store.dispatch('tambahDataAssesment', this.assesmen);
        localStorage.setItem('assesment', JSON.stringify(this.assesmen));
        console.log('assesment', this.assesmen)
        //post api
        //const res = await axios.post('http://localhost/rekmed-server/api/v1/Assesment/post',t).then(res => res.data.assesment)
        //console.log('assesment',[this.a])

        //plan diagnosis
        for (var i = this.input_plan_diagnostik.length - 1; i >= 0; i--) {
          let temp_plan_diag = {
            'ID': this.input_plan_diagnostik[i].ID,
            'ID_pasien': this.pasien_rekmed.ID,
            'nama_diagnosis': this.input_plan_diagnostik[i].value
          }
          this.plan_diagnostik.push(temp_plan_diag)
        }
        this.$store.dispatch('tambahDataPlanDiagnosis', this.plan_diagnostik);
        localStorage.setItem('plan_diagnosis', JSON.stringify(this.plan_diagnostik));
        console.log('plan_diagnostik', this.plan_diagnostik)

        //plan terapi
        for (var i = this.input_plan_terapi.length - 1; i >= 0; i--) {
          let temp_plan_te = {
            'ID': this.input_plan_terapi[i].ID,
            'ID_pasien': this.pasien_rekmed.ID,
            'nama_terapi': this.input_plan_terapi[i].value
          }
          this.plan_terapi.push(temp_plan_te)
        }
        this.$store.dispatch('tambahDataPlanTerapi', this.plan_terapi);
        localStorage.setItem('plan_terapi', JSON.stringify(this.plan_terapi));
        console.log('plan_terapi', this.plan_terapi)

        //plan edukasi
        for (var i = this.input_plan_edukasi.length - 1; i >= 0; i--) {
          let temp_plan_edu = {
            'ID': this.input_plan_edukasi[i].ID,
            'ID_pasien': this.pasien_rekmed.ID,
            'nama_edukasi': this.input_plan_edukasi[i].value
          }
          this.plan_edukasi.push(temp_plan_edu)
        }
        this.$store.dispatch('tambahDataPlanEdukasi', this.plan_edukasi);
        localStorage.setItem('plan_edukasi', JSON.stringify(this.plan_edukasi));
        console.log('plan_edukasi', this.plan_edukasi)

        //diagnosis
        for (var i = this.input_diagnosis.length - 1; i >= 0; i--) {
          let temp_diagnosis = {
            'ID': this.input_diagnosis[i].ID,
            'ID_pasien': this.pasien_rekmed.ID,
            'nama': this.input_diagnosis[i].value
          }
          this.diagnosis.push(temp_diagnosis)
        }
        this.$store.dispatch('tambahDataDiagnosis', this.diagnosis);
        localStorage.setItem('diagnosis', JSON.stringify(this.diagnosis));
        console.log('diagnosis', this.diagnosis)

        //tindakan
        for (var i = this.input_tindakan.length - 1; i >= 0; i--) {
          let temp_tindakan = {
            'ID': this.input_tindakan[i].ID,
            'ID_pasien': this.pasien_rekmed.ID,
            'nama_tindakan': this.input_tindakan[i].value
          }
          this.tindakan.push(temp_tindakan)
        }
        this.$store.dispatch('tambahDataTindakan', this.tindakan);
        localStorage.setItem('tindakan', JSON.stringify(this.tindakan));
        console.log('tindakan', this.tindakan)
      },
      Simpan() {
        this.$v.$touch()
        if(this.$v.$invalid) {
          this.submit_status = "Gagal"
        } else {
          this.tambahDataSemua()
        }
      }
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

  @media print {
    body * {
      visibility: hidden;
    }
    #invoice-payment, #invoice-payment * {
      visibility: visible;
    }
    #invoice-payment {
      /* position: absolute; */
      /* left: 240px; */
      top: 0px;
      transform: scale(1.0);
      /* zoom: 100%; */
    }
  }
</style>
