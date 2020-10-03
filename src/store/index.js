/*eslint-disable*/
import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

const resource_uri = "http://localhost/rekmed-server/api/v1/";

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
  	administrasi : {},
  	dokter : {},
  	login : {},
  	rekam_medis : {
      subjective : [],
      objective : {},
      assesment : [],
      plan :  {
        diagnosis : [],
        terapi : [],
        edukasi : [],
      },
    },
  	resep : {},
  	pasien : {},
    list_pasien : [],
    list_antrian : [],
    rekam_medis_pasien : []
  },
  getters : {
  	allPasien : state => state.pasien,
  	allDokter : state => state.dokter,
  	allRekmed : state => state.rekam_medis,
  	allResep : state => state.resep,
  	allAdministrasi : state => state.administrasi
  },
  actions: {
  	/*tampil data*/
  	async tampilDataPasien({ commit }) {
  		const response = await axios.get(resource_uri + "Registrasi/get");
  		commit('setPasien', response.data);
  	},
  	async tampilDataDokter({ commit }) {
  		const response = await axios.get(resource_uri + "Dokter/get");
  		commit('setDokter', response.data);
  	},
  	async tampilDataRekmedPasien({ commit }) {
  		const response = await axios.get(resource_uri + "Rekam_Medis/get");
  		commit('setRekmedPasien', response.data); 
  	},
  	async tampilDataResep({ commit }) {
  		const response = await axios.get(resource_uri + "Resep/get");
  		commit('setResep', response.data);
  	},
  	async tampilDataAdministrasi({ commit }) {
  		const response = await axios.get(resource_uri + "Administrasi/get");
  		commit('setAdministrasi', response.data);
  	},
  	/*tambah data*/
  	async tambahDataPasien({ commit }, pasien) {
  		// const response = await axios.post(resource_uri + "Registrasi/post", pasien);
  		commit('setNewPasien', pasien);
  	},
    async tambahDataSubjective({ commit }, subjective) {
      commit('setNewSubjective', subjective);
    },
    async tambahDataObjective({ commit }, objective) {
      commit('setNewObjective', objective);
    },
    async tambahDataAssesment({ commit }, assesment) {
      commit('setNewAssesment', assesment);
    },
    async tambahDataPlan({ commit }, plan) {
      commit('setNewPlan', plan);
    },
    async tambahListAntrian({ commit }, antrian) {
      commit('setNewAntrian', antrian);
    },
   /* simpan data*/
   async simpanDataPasien({ commit}, pasien) {
    commit('setDataPasien'. pasien);
   }
  },
  mutations: {
  	/*tampil data*/
  	setPasien: (state, pasien) => state.list_pasien = pasien,
  	setDokter: (state, dokter) => state.dokter = dokter,
  	setRekmed: (state, rekam_medis) => state.rekam_medis = rekam_medis,
    setRekmedPasien: (state, rekam_medis) => state.rekam_medis_pasien = rekam_medis,
  	setResep: (state, resep) => state.resep = resep,
  	setAdministrasi: (state, administrasi) => state.administrasi = administrasi,

  	/*tambah data*/
    setNewPasien :(state, pasien) => state.pasien = pasien,
    setNewAntrian :(state, antrian) => state.list_antrian = antrian,
    setNewSubjective :(state, subjective) => state.rekam_medis.subjective = subjective,
    setNewObjective :(state, objective) => state.rekam_medis.objective = objective,
    setNewAssesment :(state, assesment) => state.rekam_medis.assesment = assesment,
    setNewPlan :(state, plan) => state.rekam_medis.plan = plan,

    /*simpan data*/
    setDataPasien :(state, pasien) => state.pasien = pasien
  },
  modules: {
  }
})
