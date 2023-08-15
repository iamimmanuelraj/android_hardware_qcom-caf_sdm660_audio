#BOARD_USES_GENERIC_AUDIO := true
#
#AUDIO_FEATURE_FLAGS
BOARD_USES_ALSA_AUDIO := true

ifneq ($(TARGET_USES_AOSP_FOR_AUDIO), true)
USE_CUSTOM_AUDIO_POLICY := 1
AUDIO_FEATURE_QSSI_COMPLIANCE := true
AUDIO_FEATURE_ENABLED_COMPRESS_CAPTURE := false
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := false
AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
AUDIO_FEATURE_ENABLED_EXTN_FLAC_DECODER := true
AUDIO_FEATURE_ENABLED_EXTN_RESAMPLER := true
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true
AUDIO_FEATURE_ENABLED_HDMI_SPK := true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD := true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD_24 := true
AUDIO_FEATURE_ENABLED_FLAC_OFFLOAD := true
AUDIO_FEATURE_ENABLED_VORBIS_OFFLOAD := true
AUDIO_FEATURE_ENABLED_WMA_OFFLOAD := true
AUDIO_FEATURE_ENABLED_ALAC_OFFLOAD := true
AUDIO_FEATURE_ENABLED_APE_OFFLOAD := true
AUDIO_FEATURE_ENABLED_AAC_ADTS_OFFLOAD := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
AUDIO_FEATURE_ENABLED_SSR := true
AUDIO_FEATURE_ENABLED_DTS_EAGLE := false
BOARD_USES_SRS_TRUEMEDIA := false
DTS_CODEC_M_ := false
MM_AUDIO_ENABLED_SAFX := true
AUDIO_FEATURE_ENABLED_HW_ACCELERATED_EFFECTS := false
AUDIO_FEATURE_ENABLED_AUDIOSPHERE := true
AUDIO_FEATURE_ENABLED_USB_TUNNEL := true
AUDIO_FEATURE_ENABLED_A2DP_OFFLOAD := true
AUDIO_FEATURE_ENABLED_3D_AUDIO := false
AUDIO_FEATURE_ENABLED_VOICE_PRINT := false
USE_LEGACY_AUDIO_DAEMON := false
USE_LEGACY_AUDIO_MEASUREMENT := false
AUDIO_FEATURE_ENABLED_AHAL_EXT := false
AUDIO_FEATURE_ENABLED_EXTENDED_COMPRESS_FORMAT := true
DOLBY_ENABLE := false
endif

USE_XML_AUDIO_POLICY_CONF := 1
BOARD_SUPPORTS_SOUND_TRIGGER := true
AUDIO_USE_DEEP_AS_PRIMARY_OUTPUT := false
AUDIO_FEATURE_ENABLED_HIFI_AUDIO := true
AUDIO_FEATURE_ENABLED_VBAT_MONITOR := true
AUDIO_FEATURE_ENABLED_NT_PAUSE_TIMEOUT := true
AUDIO_FEATURE_ENABLED_ANC_HEADSET := true
AUDIO_FEATURE_ENABLED_CUSTOMSTEREO := true
AUDIO_FEATURE_ENABLED_FLUENCE := true
AUDIO_FEATURE_ENABLED_HDMI_EDID := true
AUDIO_FEATURE_ENABLED_HDMI_PASSTHROUGH := true
#AUDIO_FEATURE_ENABLED_KEEP_ALIVE := true
AUDIO_FEATURE_ENABLED_DISPLAY_PORT := true
AUDIO_FEATURE_ENABLED_DS2_DOLBY_DAP := false
AUDIO_FEATURE_ENABLED_HFP := true
AUDIO_FEATURE_ENABLED_INCALL_MUSIC := false
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE := true
AUDIO_FEATURE_ENABLED_SPKR_PROTECTION := true
AUDIO_FEATURE_ENABLED_ACDB_LICENSE := true
AUDIO_FEATURE_ENABLED_DEV_ARBI := false
AUDIO_FEATURE_ENABLED_DYNAMIC_LOG := true
MM_AUDIO_ENABLED_FTM := true
TARGET_USES_QCOM_MM_AUDIO := true
AUDIO_FEATURE_ENABLED_SOURCE_TRACKING := true
AUDIO_FEATURE_ENABLED_GEF_SUPPORT := true
AUDIO_FEATURE_ENABLED_RAS := true
AUDIO_FEATURE_ENABLED_SND_MONITOR := true
AUDIO_FEATURE_ENABLED_SVA_MULTI_STAGE := true

ifeq ($(TARGET_KERNEL_VERSION), 4.4)
   AUDIO_FEATURE_ENABLED_DLKM := false
else
    AUDIO_FEATURE_ENABLED_DLKM := true
endif

##AUDIO_FEATURE_FLAGS

#Audio Specific device overlays
DEVICE_PACKAGE_OVERLAYS += $(TARGET_HALS_PATH)/audio/configs/common/overlay

# Audio configuration file
ifeq ($(TARGET_USES_AOSP_FOR_AUDIO), true)
PRODUCT_COPY_FILES += \
    device/qcom/common/media/audio_policy.conf:vendor/etc/audio_policy.conf
else
PRODUCT_COPY_FILES += \
    $(TARGET_HALS_PATH)/audio/configs/sdm660/audio_policy.conf:vendor/etc/audio_policy.conf
endif

PRODUCT_COPY_FILES += \
    $(TARGET_HALS_PATH)/audio/configs/sdm660/audio_output_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_output_policy.conf \
    $(TARGET_HALS_PATH)/audio/configs/sdm660/audio_effects.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.conf \
    $(TARGET_HALS_PATH)/audio/configs/sdm660/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(TARGET_HALS_PATH)/audio/configs/sdm660/mixer_paths_skush.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_skush.xml \
    $(TARGET_HALS_PATH)/audio/configs/sdm660/mixer_paths_i2s.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_i2s.xml \
    $(TARGET_HALS_PATH)/audio/configs/sdm660/mixer_paths_tasha.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tasha.xml \
    $(TARGET_HALS_PATH)/audio/configs/sdm660/mixer_paths_mtp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_mtp.xml \
    $(TARGET_HALS_PATH)/audio/configs/sdm660/mixer_paths_tashalite.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tashalite.xml \
    $(TARGET_HALS_PATH)/audio/configs/sdm660/mixer_paths_tavil.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tavil.xml \
    $(TARGET_HALS_PATH)/audio/configs/sdm660/mixer_paths_tasha_skus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tasha_skus.xml \
    $(TARGET_HALS_PATH)/audio/configs/sdm660/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    $(TARGET_HALS_PATH)/audio/configs/sdm660/audio_tuning_mixer.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer.txt \
    $(TARGET_HALS_PATH)/audio/configs/sdm660/audio_tuning_mixer_tavil.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer_tavil.txt \
    $(TARGET_HALS_PATH)/audio/configs/sdm660/audio_tuning_mixer_tasha.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer_tasha.txt \
    $(TARGET_HALS_PATH)/audio/configs/sdm660/audio_platform_info_tasha.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_tasha.xml \
    $(TARGET_HALS_PATH)/audio/configs/sdm660/audio_platform_info_tashalite.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_tashalite.xml \
    $(TARGET_HALS_PATH)/audio/configs/sdm660/audio_platform_info_tavil.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_tavil.xml \
    $(TARGET_HALS_PATH)/audio/configs/sdm660/audio_platform_info_tasha_skus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_tasha_skus.xml \
    $(TARGET_HALS_PATH)/audio/configs/sdm660/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_intcodec.xml \
    $(TARGET_HALS_PATH)/audio/configs/sdm660/audio_platform_info_skush.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_skush.xml \
    $(TARGET_HALS_PATH)/audio/configs/sdm660/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths.xml \
    $(TARGET_HALS_PATH)/audio/configs/sdm660/sound_trigger_mixer_paths_wcd9330.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_wcd9330.xml \
    $(TARGET_HALS_PATH)/audio/configs/sdm660/sound_trigger_mixer_paths_wcd9335.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_wcd9335.xml \
    $(TARGET_HALS_PATH)/audio/configs/sdm660/sound_trigger_mixer_paths_wcd9340.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_wcd9340.xml \
    $(TARGET_HALS_PATH)/audio/configs/sdm660/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_platform_info.xml \
    $(TARGET_HALS_PATH)/audio/configs/sdm660/graphite_ipc_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/graphite_ipc_platform_info.xml \
    $(TARGET_HALS_PATH)/audio/configs/sdm660/audio_configs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_configs.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml


#XML Audio configuration files
ifeq ($(USE_XML_AUDIO_POLICY_CONF), 1)
ifneq ($(TARGET_USES_AOSP_FOR_AUDIO), true)
PRODUCT_COPY_FILES += \
    $(TARGET_HALS_PATH)/audio/configs/sdm660/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/audio_policy_configuration.xml
endif
PRODUCT_COPY_FILES += \
    $(TARGET_HALS_PATH)/audio/configs/sdm660/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
    $(TARGET_HALS_PATH)/audio/configs/common/bluetooth_qti_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_qti_audio_policy_configuration.xml
endif

# Listen configuration file
PRODUCT_COPY_FILES += \
    $(TARGET_HALS_PATH)/audio/configs/sdm660/listen_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/listen_platform_info.xml

# Reduce client buffer size for fast audio output tracks
PRODUCT_VENDOR_PROPERTIES += \
    af.fast_track_multiplier=1

# Low latency audio buffer size in frames
PRODUCT_VENDOR_PROPERTIES += \
    vendor.audio_hal.period_size=192

##fluencetype can be "fluence" or "fluencepro" or "none"
PRODUCT_VENDOR_PROPERTIES += \
ro.vendor.audio.sdk.fluencetype=none\
persist.vendor.audio.fluence.voicecall=true\
persist.vendor.audio.fluence.voicerec=false\
persist.vendor.audio.fluence.speaker=true

#disable tunnel encoding
PRODUCT_VENDOR_PROPERTIES += \
vendor.audio.tunnel.encode=false

#Disable RAS Feature by default
PRODUCT_VENDOR_PROPERTIES += \
persist.vendor.audio.ras.enabled=false

#Buffer size in kbytes for compress offload playback
PRODUCT_VENDOR_PROPERTIES += \
vendor.audio.offload.buffer.size.kb=64

#Minimum duration for offload playback in secs
PRODUCT_VENDOR_PROPERTIES += \
audio.offload.min.duration.secs=30

#Enable offload audio video playback by default
PRODUCT_VENDOR_PROPERTIES += \
audio.offload.video=true

#Enable audio track offload by default
PRODUCT_VENDOR_PROPERTIES += \
vendor.audio.offload.track.enable=true

#Enable music through deep buffer
PRODUCT_VENDOR_PROPERTIES += \
audio.deep_buffer.media=true

#enable voice path for PCM VoIP by default
PRODUCT_VENDOR_PROPERTIES += \
vendor.voice.path.for.pcm.voip=true

#Enable multi channel aac through offload
PRODUCT_VENDOR_PROPERTIES += \
vendor.audio.offload.multiaac.enable=true

#Enable DS2, Hardbypass feature for Dolby
PRODUCT_VENDOR_PROPERTIES += \
vendor.audio.dolby.ds2.enabled=false\
vendor.audio.dolby.ds2.hardbypass=false

#Disable Multiple offload sesison
PRODUCT_VENDOR_PROPERTIES += \
vendor.audio.offload.multiple.enabled=false

#Disable Compress passthrough playback
PRODUCT_VENDOR_PROPERTIES += \
vendor.audio.offload.passthrough=false

#Disable surround sound recording
PRODUCT_VENDOR_PROPERTIES += \
ro.vendor.audio.sdk.ssr=false

#enable dsp gapless mode by default
PRODUCT_VENDOR_PROPERTIES += \
vendor.audio.offload.gapless.enabled=true

#enable pbe effects
PRODUCT_VENDOR_PROPERTIES += \
vendor.audio.safx.pbe.enabled=false

#parser input buffer size(256kb) in byte stream mode
PRODUCT_VENDOR_PROPERTIES += \
vendor.audio.parser.ip.buffer.size=262144

#flac sw decoder 24 bit decode capability
PRODUCT_VENDOR_PROPERTIES += \
vendor.audio.flac.sw.decoder.24bit=true

#timeout crash duration set to 20sec before system is ready.
#timeout duration updates to default timeout of 5sec once the system is ready.
PRODUCT_VENDOR_PROPERTIES += \
vendor.audio.hal.boot.timeout.ms=20000

#split a2dp DSP supported encoder list
PRODUCT_VENDOR_PROPERTIES += \
persist.vendor.bt.a2dp_offload_cap=sbc-aptx-aptxhd-aac

# A2DP offload support
PRODUCT_VENDOR_PROPERTIES += \
ro.bluetooth.a2dp_offload.supported=true

# Disable A2DP offload
PRODUCT_VENDOR_PROPERTIES += \
persist.bluetooth.a2dp_offload.disabled=false

# A2DP offload DSP supported encoder list
PRODUCT_VENDOR_PROPERTIES += \
persist.bluetooth.a2dp_offload.cap=sbc-aac-aptx-aptxhd-ldac

#enable software decoders for ALAC and APE
PRODUCT_VENDOR_PROPERTIES += \
vendor.audio.use.sw.alac.decoder=true
PRODUCT_VENDOR_PROPERTIES += \
vendor.audio.use.sw.ape.decoder=true

#enable hw aac encoder by default
PRODUCT_VENDOR_PROPERTIES += \
vendor.audio.hw.aac.encoder=true

#Enable HIFI audio support for internal codec
PRODUCT_VENDOR_PROPERTIES += \
persist.vendor.audio.hifi.int_codec=true

#Set AudioFlinger client heap size
PRODUCT_VENDOR_PROPERTIES += \
ro.af.client_heap_size_kbyte=7168

PRODUCT_VENDOR_PROPERTIES += \
persist.vendor.audio.hw.binder.size_kbyte=1024

#enable headset calibration
PRODUCT_VENDOR_PROPERTIES += \
vendor.audio.volume.headset.gain.depcal=true

#enable AAC frame ctl for A2DP sinks
PRODUCT_VENDOR_PROPERTIES += \
persist.vendor.bt.aac_frm_ctl.enabled=true

#Set speaker protection cal tx path sampling rate to 48k
PRODUCT_VENDOR_PROPERTIES += \
vendor.audio.spkr_prot.tx.sampling_rate=48000

#add dynamic feature flags here
PRODUCT_VENDOR_PROPERTIES += \
vendor.audio.feature.a2dp_offload.enable=true \
vendor.audio.feature.afe_proxy.enable=true \
vendor.audio.feature.anc_headset.enable=true \
vendor.audio.feature.battery_listener.enable=false \
vendor.audio.feature.compr_cap.enable=false \
vendor.audio.feature.compress_in.enable=false \
vendor.audio.feature.compress_meta_data.enable=true \
vendor.audio.feature.compr_voip.enable=false \
vendor.audio.feature.concurrent_capture.enable=false \
vendor.audio.feature.custom_stereo.enable=true \
vendor.audio.feature.display_port.enable=true \
vendor.audio.feature.dsm_feedback.enable=false \
vendor.audio.feature.dynamic_ecns.enable=false \
vendor.audio.feature.ext_hw_plugin.enable=false \
vendor.audio.feature.external_dsp.enable=false \
vendor.audio.feature.external_speaker.enable=false \
vendor.audio.feature.external_speaker_tfa.enable=false \
vendor.audio.feature.fluence.enable=true \
vendor.audio.feature.fm.enable=true \
vendor.audio.feature.hdmi_edid.enable=true \
vendor.audio.feature.hdmi_passthrough.enable=true \
vendor.audio.feature.hfp.enable=true \
vendor.audio.feature.hifi_audio.enable=true \
vendor.audio.feature.hwdep_cal.enable=false \
vendor.audio.feature.incall_music.enable=true \
vendor.audio.feature.multi_voice_session.enable=true \
vendor.audio.feature.keep_alive.enable=false \
vendor.audio.feature.kpi_optimize.enable=true \
vendor.audio.feature.maxx_audio.enable=false \
vendor.audio.feature.ras.enable=true \
vendor.audio.feature.record_play_concurency.enable=false \
vendor.audio.feature.src_trkn.enable=true \
vendor.audio.feature.spkr_prot.enable=true \
vendor.audio.feature.ssrec.enable=true \
vendor.audio.feature.usb_offload.enable=true \
vendor.audio.feature.usb_offload_burst_mode.enable=false \
vendor.audio.feature.usb_offload_sidetone_volume.enable=false \
vendor.audio.feature.deepbuffer_as_primary.enable=false \
vendor.audio.feature.vbat.enable=true \
vendor.audio.feature.wsa.enable=false \
vendor.audio.feature.audiozoom.enable=false \
vendor.audio.feature.snd_mon.enable=true

# for HIDL related packages
PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-service \
    android.hardware.audio@2.0-impl \
    android.hardware.audio.effect@2.0-impl \
    android.hardware.soundtrigger@2.1-impl \
    android.hardware.audio@4.0 \
    android.hardware.audio.common@4.0 \
    android.hardware.audio.common@4.0-util \
    android.hardware.audio@4.0-impl \
    android.hardware.audio.effect@4.0 \
    android.hardware.audio.effect@4.0-impl

# enable audio hidl hal 5.0
PRODUCT_PACKAGES += \
    android.hardware.audio@5.0 \
    android.hardware.audio.common@5.0 \
    android.hardware.audio.common@5.0-util \
    android.hardware.audio@5.0-impl \
    android.hardware.audio.effect@5.0 \
    android.hardware.audio.effect@5.0-impl

# enable audio hidl hal 6.0
PRODUCT_PACKAGES += \
    android.hardware.audio@6.0 \
    android.hardware.audio.common@6.0 \
    android.hardware.audio.common@6.0-util \
    android.hardware.audio@6.0-impl \
    android.hardware.audio.effect@6.0 \
    android.hardware.audio.effect@6.0-impl

ifeq ($(TARGET_KERNEL_VERSION), 4.19)
# enable sound trigger hidl hal 2.2
PRODUCT_PACKAGES += \
    android.hardware.soundtrigger@2.2-impl

# enable sound trigger hidl hal 2.3
PRODUCT_PACKAGES += \
    android.hardware.soundtrigger@2.3-impl
endif

PRODUCT_PACKAGES_ENG += \
    VoicePrintTest \
    VoicePrintDemo

PRODUCT_PACKAGES_DEBUG += \
    AudioSettings
