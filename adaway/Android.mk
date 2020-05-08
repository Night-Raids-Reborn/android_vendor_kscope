TARGET_GENERATED_HOSTS_BLOCKER := $(TARGET_OUT_INTERMEDIATES)/ADBLOCK/hosts.kscope_adblock
$(TARGET_GENERATED_HOSTS_BLOCKER): INTERMEDIATES := $(TARGET_OUT_INTERMEDIATES)/ADBLOCK
$(TARGET_GENERATED_HOSTS_BLOCKER): vendor/kscope/adaway/generate.sh vendor/kscope/adaway/generate.py external/hosts/hosts
	vendor/aosp/adaway/generate.sh $@

include $(CLEAR_VARS)
LOCAL_MODULE := hosts.kscope_adblock
LOCAL_MODULE_CLASS := ETC

include $(BUILD_SYSTEM)/base_rules.mk

$(LOCAL_BUILT_MODULE): $(TARGET_GENERATED_HOSTS_BLOCKER)
	@cp $< $@
