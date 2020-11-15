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
    biaya : [],
    obat : [],
    diagnosis : [],
    tindakan : [],
    racikan_obat : [],
    racikan : [],
  	resep : {},
  	pasien : {},
    list_pasien : [],
    list_assesment: [],
    list_antrian : [],
    list_plan_diagnosis : [],
    list_plan_edukasi : [],
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
    async tambahDataPlanDiagnosis({ commit }, plan_diagnosis) {
      commit('setNewPlanDiagnosis', plan_diagnosis);
    },
    async tambahDataPlanTerapi({ commit }, plan_terapi) {
      commit('setNewPlanTerapi', plan_terapi);
    },
    async tambahDataPlanEdukasi({ commit }, plan_edukasi) {
      commit('setNewPlanEdukasi', plan_edukasi);
    },
    async tambahListAntrian({ commit }, antrian) {
      commit('setNewAntrian', antrian);
    },
    async tambahListAssesment({ commit }, list_assesment) {
      commit('setNewListAssesment', list_assesment);
    },
    async tambahListPlanDiagnosis({ commit }, list_plan_diagnosis) {
      commit('setNewListPlanDiagnosis', list_plan_diagnosis);
    },
    async tambahListPlanEdukasi({ commit }, list_plan_edukasi) {
      commit('setNewListPlanEdukasi', list_plan_edukasi);
    },
    async tambahDataObat({ commit }, obat) {
      commit('setNewObat', obat);
    },
    async tambahDataRacikanObat({ commit }, racikan_obat) {
      commit('setNewRacikanObat', racikan_obat);
    },
    async tambahDataRacikan({ commit }, racikan) {
      commit('setNewRacikan', racikan);
    },
    async tambahDataDiagnosis({ commit }, diagnosis) {
      commit('setNewDiagnosis', diagnosis);
    },
    async tambahDataTindakan({ commit }, tindakan) {
      commit('setNewTindakan', tindakan);
    },
   /* simpan data*/
   async simpanDataPasien({ commit }, pasien) {
    commit('setDataPasien', pasien);
   },
   async simpanBiaya({ commit }, biaya) {
    commit('setBiaya', biaya)
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
    setNewListAssesment : (state, list_assesment) => state.list_assesment = list_assesment,
    setNewListPlanDiagnosist : (state, list_plan_diagnosis) => state.list_plan_diagnosis = list_plan_diagnosis,
    setNewListPlanEdukasi : (state, list_plan_edukasi) => state.list_plan_edukasi = list_plan_edukasi,
    setNewPlanDiagnosis : (state, plan_diagnosis) => state.rekam_medis.plan.diagnosis = plan_diagnosis,
    setNewPlanTerapi : (state, plan_terapi) => state.rekam_medis.plan.terapi = plan_terapi,
    setNewPlanEdukasi : (state, plan_edukasi) => state.rekam_medis.plan.edukasi = plan_edukasi,
    setNewObat : (state, obat) => state.obat = obat,
    setNewRacikanObat : (state, racikan_obat) => state.racikan_obat = racikan_obat,
    setNewRacikan : (state, racikan) => state.racikan = racikan,
    setNewDiagnosis : (state, diagnosis) => state.diagnosis = diagnosis,
    setNewTindakan : (state, tindakan) => state.tindakan = tindakan,

    /*simpan data*/
    setDataPasien :(state, pasien) => state.pasien = pasien,
    setBiaya :(state, biaya) => state.biaya = biaya
  },
  modules: {
  }
})
