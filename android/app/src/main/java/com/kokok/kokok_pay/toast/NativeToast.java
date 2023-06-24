package com.kokok.kokok_pay.toast;

import android.app.Activity;
import android.util.Log;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.kokok.kokok_pay.R;

import java.lang.ref.WeakReference;
import java.util.HashMap;

public class NativeToast {
    private static final String TAG = "NativeToast";
    private ToastDto toastDto;
    private Toast toast;
    private ImageView imageView;
    private TextView textView;

    private final WeakReference<Activity> activityRef;
    private static NativeToast nativeToast;

    private NativeToast(final Activity activity) {
        this.activityRef = new WeakReference<>(activity);
    }


    public static NativeToast getInstance(final Activity activity) {
        if (nativeToast == null) {
            nativeToast = new NativeToast(activity);
        }
        return nativeToast;
    }

    public void prepareLayout() {
        LayoutInflater inflater = activityRef.get().getLayoutInflater();
        LinearLayout layout = (LinearLayout) inflater.inflate(R.layout.toast_layout, activityRef.get().findViewById(R.id.toast_layout_root));
        textView = layout.findViewById(R.id.tv_message);
        imageView = layout.findViewById(R.id.iv_icon);
        toast = new Toast(activityRef.get().getApplicationContext());
        toast.setView(layout);
        toast.setDuration(Toast.LENGTH_SHORT);
    }


    public void prepareToastData(Object arguments) {
        Log.i(TAG, "prepareToastData: prepareToastData: " + arguments);
        if (!(arguments instanceof HashMap)) return;
        final HashMap<String, Object> toastData = (HashMap<String, Object>) arguments;
        String message = (String) toastData.get("message");
        String position = (String) toastData.get("position");
        String type = (String) toastData.get("type");
        boolean dark = toastData.get("dark") != null && (boolean) toastData.get("dark");

        toastDto = new ToastDto(
                message != null ? message : "no message",
                ToastPosition.getInstance(position),
                ToastType.getInstance(type),
                dark
        );
    }


    public void showToast() {
        Log.i(TAG, "showToast: showToast: " + toastDto);
        if (toastDto.getToastType() == ToastType.SUCCESS) {
            imageView.setImageResource(R.drawable.baseline_success_circle_24);
            imageView.setVisibility(View.VISIBLE);
        } else if (toastDto.getToastType() == ToastType.FAILED) {
            imageView.setImageResource(R.drawable.baseline_error_outline_24);
            imageView.setVisibility(View.VISIBLE);
        } else if (toastDto.getToastType() == ToastType.WARNING) {
            imageView.setImageResource(R.drawable.baseline_warning_24);
            imageView.setVisibility(View.VISIBLE);
        } else {
            imageView.setVisibility(View.GONE);
        }
        textView.setText(toastDto.getToastMessage());
        if (toastDto.getToastPosition() == ToastPosition.BOTTOM) {
            toast.setGravity(Gravity.BOTTOM, 0, 50);
        } else if (toastDto.getToastPosition() == ToastPosition.TOP) {
            toast.setGravity(Gravity.TOP, 0, 100);
        } else {
            toast.setGravity(Gravity.CENTER, 0, 0);
        }
        toast.show();
    }

}
