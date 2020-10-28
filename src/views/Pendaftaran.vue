<!-- eslint-disable -->
<template>
  <div class="pendaftaran">
    <!-- Sidebar -->
    <SidebarNav />

    <!-- Page Content -->
    <div id="content">

      <!-- Infodata -->
      <InfoData />

      <!-- <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
          <button type="button" id="sidebarCollapse" class="btn btn-info">
            <i class="fas fa-align-left"></i>
            <span>Toggle Sidebar</span>
          </button>
        </div>
      </nav> -->

      <h2 class="my-3 font-weight-bold">Pendaftaran Pasien Baru</h2>
      <form @submit.prevent="onSubmit">
        <div class="form-row">
          <div class="form-group col-md-6">
            <label>NIK</label>
            <input type="text" class="form-control" v-model.trim="$v.NIK.$model" :class="{'is-invalid' : $v.NIK.$error, 'is-valid' : !$v.NIK.$invalid}">
            <div class="valid-feedback">NIK Sudah!</div>
            <div class="invalid-feedback">
              <span v-if="!$v.NIK.required">NIK Tidak Boleh Kosong </span>
              <span v-if="!$v.NIK.numeric">NIK Harus Angka </span>
              <div v-if="$v.NIK.numeric">
                <span v-if="!$v.NIK.minLength">NIK Wajib Berisi {{ $v.NIK.$params.minLength.min }} Digit </span>
                <span v-if="!$v.NIK.maxLength">NIK Wajib Berisi {{ $v.NIK.$params.maxLength.max }} Digit </span>
              </div>
            </div>
          </div>
          <div class="form-group col-md-6">
            <label>Nama Pasien</label>
            <input type="text" class="form-control" v-model.trim="$v.nama.$model" :class="{'is-invalid' : $v.nama.$error, 'is-valid' : !$v.nama.$invalid}">
            <div class="valid-feedback">Nama Sudah!</div>
            <div class="invalid-feedback">
              <span v-if="!$v.nama.required">Nama Tidak Boleh Kosong </span>
              <span v-if="!$v.nama.isNameValid">Nama Harus Huruf</span>
            </div>
          </div>
        </div>
        <div class="form-row">
          <div class="form-group col-md-6">
            <label>Nomor HP</label>
            <input type="text" class="form-control" v-model.trim="$v.no_telp.$model" :class="{'is-invalid' : $v.no_telp.$error, 'is-valid' : !$v.no_telp.$invalid}">
            <div class="valid-feedback">Nomor HP Sudah!</div>
            <div class="invalid-feedback">
              <span v-if="!$v.no_telp.required">Nomor HP Tidak Boleh Kosong </span>
              <span v-if="!$v.no_telp.numeric">Nomor HP Harus Angka </span>
              <div v-if="$v.no_telp.numeric">
                <span v-if="!$v.no_telp.minLength">Nomor HP Minimal Harus {{ $v.no_telp.$params.minLength.min }} Digit </span>
              </div>
            </div>
          </div>
          <div class="form-group col-md-6">
            <label>Jenis Kelamin</label>
            <select v-model.trim="$v.jenis_kelamin.$model" class="form-control" :class="{'is-invalid' : $v.jenis_kelamin.$error, 'is-valid' : !$v.jenis_kelamin.$invalid}">
              <option v-for="option in options" v-bind:key="option.value" :value="option.value">{{ option.text }}</option>
            </select>
            <div class="valid-feedback">Jenis Kelamin Sudah!</div>
            <div class="invalid-feedback">
              <span v-if="!$v.jenis_kelamin.required">Jenis Kelamin Tidak Boleh Kosong </span>
            </div>
          </div>
        </div>
        <div class="form-row">
          <div class="form-group col-md-6">
            <label>Tanggal Lahir</label>
            <input type="date" class="form-control" v-model.trim="tanggal_lahir" :class="{'is-invalid' : $v.tanggal_lahir.$error, 'is-valid' : !$v.tanggal_lahir.$invalid}">
            <div class="valid-feedback">Tanggal Lahir Sudah!</div>
            <div class="invalid-feedback">
              <span v-if="!$v.tanggal_lahir.required">Tanggal Lahir Tidak Boleh Kosong </span>
            </div>
          </div>
          <div class="form-group col-md-6">
            <label>Alamat</label>
            <input type="text" class="form-control" v-model.trim="$v.alamat.$model" :class="{'is-invalid' : $v.alamat.$error, 'is-valid' : !$v.alamat.$invalid}">
          <div class="valid-feedback">Alamat Sudah!</div>
          <div class="invalid-feedback">
            <span v-if="!$v.alamat.required">Alamat Tidak Boleh Kosong </span>
          </div>
          </div>
          </div>
          <button type="submit" class="btn btn-success mt-2" style="float: right; width: 20%;">Daftar</button>
          <button type="reset" class="btn btn-secondary mr-3 mt-2" style="float: right;">Reset</button>
      </form>
    </div>
  </div>
</template>

<script>
/*eslint-disable*/
// @ is an alias to /src
import SidebarNav from '@/components/SidebarNav.vue'
import InfoData from '@/components/InfoData.vue'
import { required, minLength, maxLength, numeric, alpha, helpers } from 'vuelidate/lib/validators'
import { mapActions } from 'vuex'
import axios from "axios"

export default {
  name: 'pendaftaran',
  components: {
    SidebarNav,
    InfoData
  },
  data () {
    return {
      options : [
        { text : 'Laki-Laki', value : 'Laki-Laki' },
        { text : 'Perempuan', value : 'Perempuan' }
      ],
      NIK: '',
      nama: '',
      jenis_kelamin: '',
      tanggal_lahir: '',
      no_telp: '',
      alamat: '',
      list_antrian : {},
      submit_status : null
    }
  },
  validations : {
    NIK : {
      required,
      numeric,
      minLength: minLength(16),
      maxLength: maxLength(16)
    },
    nama : {
      required,
      isNameValid: helpers.regex('isNameValid',/^[A-Za-z_ ]*$/i)
    },
    jenis_kelamin : {
      required
    },
    tanggal_lahir : {
      required
    },
    no_telp : {
      required,
      numeric,
      minLength: minLength(10)
    },
    alamat : {
      required
    }

  },
  methods : {
    ...mapActions(['tambahDataPasien']),
    async saveData() {
      return await axios.post('http://localhost/rekmed-server/Api/v1/Registrasi/post', {
        NIK : this.NIK,
        nama: this.nama,
        jenis_kelamin: this.jenis_kelamin,
        tanggal_lahir: this.tanggal_lahir,
        no_telp: this.no_telp,
        alamat: this.alamat, 
      }).then(res => res.data)
    },
    async onSubmit() {
      this.$v.$touch()
      if(this.$v.$invalid){
        this.submit_status = "Gagal"
      } else {
        const pasiens = {
          NIK: this.NIK,
          nama: this.nama,
          jenis_kelamin: this.jenis_kelamin,
          tanggal_lahir: this.tanggal_lahir,
          no_telp: this.no_telp,
          alamat: this.alamat,
        }

        this.tambahDataPasien(pasiens);

        let p = await this.saveData().then(res => res.pasien);
        // console.log('ini p',p)
        if (p) {
          this.list_antrian.nama = p.nama
          this.list_antrian.ID_pasien = p.ID
          this.list_antrian.status = "Menunggu"

          let parseData = JSON.parse(localStorage.getItem('list_antrian')) || [];

          let antrian = parseData;

          console.log('parsedata',parseData)
          console.log('list',this.list_antrian)

          if(antrian == []) {
            antrian = [...this.$store.state.list_antrian];
            console.log('antrian',antrian)
          }
    
          antrian.push(this.list_antrian)
    
          this.$store.dispatch('tambahListAntrian', antrian)
          localStorage.setItem('list_antrian', JSON.stringify(antrian))
          this.$router.push('/');
        }
      }

      // console.log(antrian)
      // e.preventDefault();

    }
  }

  // short hand
  // @ = v-on
  // : = v-bind

  // @click or @submit = v-on:click or v-on:submit
  // :key or :class = v-bind:key or v-bind:class
}

</script>

<style>
  
</style>
