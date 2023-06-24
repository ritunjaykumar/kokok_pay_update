package com.kokok.kokok_pay;

import android.os.Bundle;
import android.util.Log;

import androidx.activity.OnBackPressedCallback;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.kokok.kokok_pay.toast.NativeToast;

import io.flutter.embedding.android.FlutterFragmentActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterFragmentActivity {
    private static final String TAG = "MainActivity";
    private static final String CHANNEL = "com.kokkok.pay/toastMessageChannel";
    private NativeToast nativeToast;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        nativeToast = NativeToast.getInstance(this);
        nativeToast.prepareLayout();
        handleBackPressed();
    }


    private void handleBackPressed() {
        OnBackPressedCallback callback = new OnBackPressedCallback(true /* enabled by default */) {
            @Override
            public void handleOnBackPressed() {
                // Handle the back button event
                Log.i(TAG, "handleOnBackPressed: back pressed");
                finish();
            }
        };
        getOnBackPressedDispatcher().addCallback(this, callback);
    }


    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler((call, result) -> {
                    Log.i(TAG, "configureFlutterEngine: calling toast message");
                    Object arguments = call.arguments();
                    if (call.method.equals("showToast")) {
                        toastConfig(arguments);
                    }
                });
    }


    private void toastConfig(Object arguments) {
        nativeToast.prepareToastData(arguments);
        nativeToast.showToast();
    }
}
