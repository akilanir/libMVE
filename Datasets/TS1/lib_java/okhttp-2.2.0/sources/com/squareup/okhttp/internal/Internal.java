package com.squareup.okhttp.internal;

import com.squareup.okhttp.Call;
import com.squareup.okhttp.Connection;
import com.squareup.okhttp.ConnectionPool;
import com.squareup.okhttp.Headers;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Protocol;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Response;
import com.squareup.okhttp.internal.http.HttpEngine;
import com.squareup.okhttp.internal.http.Transport;
import java.io.IOException;
import java.util.logging.Logger;

/* loaded from: okhttp-2.2.0.jar:com/squareup/okhttp/internal/Internal.class */
public abstract class Internal {
    public static final Logger logger = Logger.getLogger(OkHttpClient.class.getName());
    public static Internal instance;

    public abstract Transport newTransport(Connection connection, HttpEngine httpEngine) throws IOException;

    public abstract boolean clearOwner(Connection connection);

    public abstract void closeIfOwnedBy(Connection connection, Object obj) throws IOException;

    public abstract int recycleCount(Connection connection);

    public abstract void setProtocol(Connection connection, Protocol protocol);

    public abstract void setOwner(Connection connection, HttpEngine httpEngine);

    public abstract boolean isReadable(Connection connection);

    public abstract void addLine(Headers.Builder builder, String str);

    public abstract void setCache(OkHttpClient okHttpClient, InternalCache internalCache);

    public abstract InternalCache internalCache(OkHttpClient okHttpClient);

    public abstract void recycle(ConnectionPool connectionPool, Connection connection);

    public abstract RouteDatabase routeDatabase(OkHttpClient okHttpClient);

    public abstract Network network(OkHttpClient okHttpClient);

    public abstract void setNetwork(OkHttpClient okHttpClient, Network network);

    public abstract void connectAndSetOwner(OkHttpClient okHttpClient, Connection connection, HttpEngine httpEngine, Request request) throws IOException;

    public abstract Call newCall(OkHttpClient okHttpClient, Request request);

    public abstract Response callGetResponse(Call call, boolean z) throws IOException;

    public abstract void callEngineReleaseConnection(Call call) throws IOException;

    public abstract Connection callEngineGetConnection(Call call);

    public abstract boolean connectionClearOwner(Connection connection);

    public abstract void connectionSetOwner(Connection connection, Object obj);

    public abstract void connectionCloseIfOwnedBy(Connection connection, Object obj) throws IOException;
}
