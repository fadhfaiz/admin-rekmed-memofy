/*eslint-disable*/
import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

const resource_uri = "http://localhost/rekmed-server/api/v1/";

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
  	administrasi : [],
  	dokter : [],
  	login : [],
  	rekam_medis : [],
  	resep : [],
  	pasien : []
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
	async tampilDataRekmed({ commit }) {
		const response = await axios.get(resource_uri + "Rekam_Medis/get");
		commit('setRekmed', response.data); 
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
	async tambahDataPasien({ commit }, pasiens) {
		const response = await axios.post(resource_uri + "Registrasi/post", pasiens);
		commit('setNewPasien', response.data);
	}
  },
  mutations: {
  	/*tampil data*/
  	setPasien: (state, pasien) => state.pasien = pasien,
  	setDokter: (state, dokter) => state.dokter = dokter,
  	setRekmed: (state, rekam_medis) => state.rekam_medis = rekam_medis,
  	setResep: (state, resep) => state.resep = resep,
  	setAdministrasi: (state, administrasi) => state.administrasi = administrasi,

  	/*tambah data*/
    setNewPasien :(state, pasiens) => state.pasien.unshift(pasiens)
  	/*addPasien(state) {
  		state.pasien.push({
  			NIK: state.newPasien.NIK,
  			nama: state.newPasien.nama,
  			jenis_kelamin: state.newPasien.jenis_kelamin,
  			tanggal_lahir: state.newPasien.tanggal_lahir,
  			no_telp: state.newPasien.no_telp,
  			alamat: state.newPasien.alamat

  		});
  	}*/
  },
  modules: {
  }
})
