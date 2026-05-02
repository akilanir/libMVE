package com.squareup.picasso;

/* loaded from: picasso-2.5.2.jar:com/squareup/picasso/Callback.class */
public interface Callback {
    void onSuccess();

    void onError();

    /* loaded from: picasso-2.5.2.jar:com/squareup/picasso/Callback$EmptyCallback.class */
    public static class EmptyCallback implements Callback {
        @Override // com.squareup.picasso.Callback
        public void onSuccess() {
        }

        @Override // com.squareup.picasso.Callback
        public void onError() {
        }
    }
}
