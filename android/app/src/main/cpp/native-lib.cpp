#include <jni.h>
#include <string>

extern "C" jstring
Java_com_example_architecture_app_1constants_AppConstants_00024Keys_getApiKey(JNIEnv *env,jobject key) {
    std::string api_key = "59635c92c2004faa8c5b68d816ab68dd";
    return env->NewStringUTF(api_key.c_str());
}