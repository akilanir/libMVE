.class public Linfo/guardianproject/netcipher/web/WebkitProxy;
.super Ljava/lang/Object;
.source "WebkitProxy.java"


# static fields
.field private static final DEFAULT_HOST:Ljava/lang/String; = "localhost"

.field private static final DEFAULT_PORT:I = 0x1fb6

.field private static final DEFAULT_SOCKS_PORT:I = 0x235a

.field private static final REQUEST_CODE:I = 0x0

.field private static final TAG:Ljava/lang/String; = "OrbotHelpher"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getDeclaredField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 5
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;,
            Ljava/lang/NoSuchFieldException;,
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 710
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 711
    .local v0, "f":Ljava/lang/reflect/Field;
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 712
    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 715
    .local v1, "out":Ljava/lang/Object;
    return-object v1
.end method

.method private static getFieldValueSafely(Ljava/lang/reflect/Field;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p0, "field"    # Ljava/lang/reflect/Field;
    .param p1, "classInstance"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 204
    invoke-virtual {p0}, Ljava/lang/reflect/Field;->isAccessible()Z

    move-result v0

    .line 205
    .local v0, "oldAccessibleValue":Z
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 206
    invoke-virtual {p0, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 207
    .local v1, "result":Ljava/lang/Object;
    invoke-virtual {p0, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 208
    return-object v1
.end method

.method public static getRequestQueue(Landroid/content/Context;)Ljava/lang/Object;
    .registers 9
    .param p0, "ctx"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    const/4 v7, 0x0

    .line 694
    const/4 v2, 0x0

    .line 695
    .local v2, "ret":Ljava/lang/Object;
    const-string v3, "android.webkit.Network"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 696
    .local v0, "networkClass":Ljava/lang/Class;
    if-eqz v0, :cond_23

    .line 697
    const-string v3, "getInstance"

    new-array v4, v5, [Ljava/lang/Object;

    aput-object p0, v4, v7

    new-array v5, v5, [Ljava/lang/Class;

    const-class v6, Landroid/content/Context;

    aput-object v6, v5, v7

    invoke-static {v0, v3, v4, v5}, Linfo/guardianproject/netcipher/web/WebkitProxy;->invokeMethod(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;[Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    .line 700
    .local v1, "networkObj":Ljava/lang/Object;
    if-eqz v1, :cond_23

    .line 701
    const-string v3, "mRequestQueue"

    invoke-static {v1, v3}, Linfo/guardianproject/netcipher/web/WebkitProxy;->getDeclaredField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 704
    .end local v1    # "networkObj":Ljava/lang/Object;
    .end local v2    # "ret":Ljava/lang/Object;
    :cond_23
    return-object v2
.end method

.method public static getSocket(Landroid/content/Context;)Ljava/net/Socket;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 754
    const-string v0, "localhost"

    const/16 v1, 0x235a

    invoke-static {p0, v0, v1}, Linfo/guardianproject/netcipher/web/WebkitProxy;->getSocket(Landroid/content/Context;Ljava/lang/String;I)Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method

.method public static getSocket(Landroid/content/Context;Ljava/lang/String;I)Ljava/net/Socket;
    .registers 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "proxyHost"    # Ljava/lang/String;
    .param p2, "proxyPort"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 745
    new-instance v0, Ljava/net/Socket;

    invoke-direct {v0}, Ljava/net/Socket;-><init>()V

    .line 747
    .local v0, "sock":Ljava/net/Socket;
    new-instance v1, Ljava/net/InetSocketAddress;

    invoke-direct {v1, p1, p2}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    const/16 v2, 0x2710

    invoke-virtual {v0, v1, v2}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V

    .line 749
    return-object v0
.end method

.method public static initOrbot(Landroid/app/Activity;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/app/AlertDialog;
    .registers 9
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "stringTitle"    # Ljava/lang/CharSequence;
    .param p2, "stringMessage"    # Ljava/lang/CharSequence;
    .param p3, "stringButtonYes"    # Ljava/lang/CharSequence;
    .param p4, "stringButtonNo"    # Ljava/lang/CharSequence;
    .param p5, "stringDesiredBarcodeFormats"    # Ljava/lang/CharSequence;

    .prologue
    .line 764
    new-instance v1, Landroid/content/Intent;

    const-string v2, "org.torproject.android.START_TOR"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 765
    .local v1, "intentScan":Landroid/content/Intent;
    const-string v2, "android.intent.category.DEFAULT"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 768
    const/4 v2, 0x0

    :try_start_d
    invoke-virtual {p0, v1, v2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_10
    .catch Landroid/content/ActivityNotFoundException; {:try_start_d .. :try_end_10} :catch_12

    .line 769
    const/4 v2, 0x0

    .line 771
    :goto_11
    return-object v2

    .line 770
    :catch_12
    move-exception v0

    .line 771
    .local v0, "e":Landroid/content/ActivityNotFoundException;
    invoke-static {p0, p1, p2, p3, p4}, Linfo/guardianproject/netcipher/web/WebkitProxy;->showDownloadDialog(Landroid/app/Activity;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/app/AlertDialog;

    move-result-object v2

    goto :goto_11
.end method

.method private static varargs invokeMethod(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;[Ljava/lang/Class;)Ljava/lang/Object;
    .registers 9
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "params"    # [Ljava/lang/Object;
    .param p3, "types"    # [Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 728
    const/4 v2, 0x0

    .line 729
    .local v2, "out":Ljava/lang/Object;
    instance-of v3, p0, Ljava/lang/Class;

    if-eqz v3, :cond_15

    move-object v3, p0

    check-cast v3, Ljava/lang/Class;

    move-object v0, v3

    .line 730
    .local v0, "c":Ljava/lang/Class;
    :goto_a
    if-eqz p3, :cond_1a

    .line 731
    invoke-virtual {v0, p1, p3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 732
    .local v1, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v1, p0, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 739
    :goto_14
    return-object v2

    .line 729
    .end local v0    # "c":Ljava/lang/Class;
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :cond_15
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_a

    .line 734
    .restart local v0    # "c":Ljava/lang/Class;
    :cond_1a
    new-array v3, v4, [Ljava/lang/Class;

    invoke-virtual {v0, p1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 735
    .restart local v1    # "method":Ljava/lang/reflect/Method;
    new-array v3, v4, [Ljava/lang/Object;

    invoke-virtual {v1, p0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_14
.end method

.method public static resetKitKatProxy(Ljava/lang/String;Landroid/content/Context;)Z
    .registers 4
    .param p0, "appClass"    # Ljava/lang/String;
    .param p1, "appContext"    # Landroid/content/Context;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x13
    .end annotation

    .prologue
    .line 261
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1}, Linfo/guardianproject/netcipher/web/WebkitProxy;->setKitKatProxy(Ljava/lang/String;Landroid/content/Context;Ljava/lang/String;I)Z

    move-result v0

    return v0
.end method

.method public static resetLollipopProxy(Ljava/lang/String;Landroid/content/Context;)Z
    .registers 4
    .param p0, "appClass"    # Ljava/lang/String;
    .param p1, "appContext"    # Landroid/content/Context;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 357
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Linfo/guardianproject/netcipher/web/WebkitProxy;->setWebkitProxyLollipop(Landroid/content/Context;Ljava/lang/String;I)Z

    move-result v0

    return v0
.end method

.method public static resetProxy(Ljava/lang/String;Landroid/content/Context;)V
    .registers 4
    .param p0, "appClass"    # Ljava/lang/String;
    .param p1, "ctx"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 632
    const-string v0, "http.proxyHost"

    invoke-static {v0}, Ljava/lang/System;->clearProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 633
    const-string v0, "http.proxyPort"

    invoke-static {v0}, Ljava/lang/System;->clearProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 634
    const-string v0, "https.proxyHost"

    invoke-static {v0}, Ljava/lang/System;->clearProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 635
    const-string v0, "https.proxyPort"

    invoke-static {v0}, Ljava/lang/System;->clearProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 638
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-ge v0, v1, :cond_1e

    .line 640
    invoke-static {p1}, Linfo/guardianproject/netcipher/web/WebkitProxy;->resetProxyForGingerBread(Landroid/content/Context;)V

    .line 651
    :goto_1d
    return-void

    .line 642
    :cond_1e
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-ge v0, v1, :cond_28

    .line 644
    invoke-static {}, Linfo/guardianproject/netcipher/web/WebkitProxy;->resetProxyForICS()V

    goto :goto_1d

    .line 648
    :cond_28
    invoke-static {p0, p1}, Linfo/guardianproject/netcipher/web/WebkitProxy;->resetKitKatProxy(Ljava/lang/String;Landroid/content/Context;)Z

    goto :goto_1d
.end method

.method private static resetProxyForGingerBread(Landroid/content/Context;)V
    .registers 4
    .param p0, "ctx"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 687
    invoke-static {p0}, Linfo/guardianproject/netcipher/web/WebkitProxy;->getRequestQueue(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v0

    .line 688
    .local v0, "requestQueueObject":Ljava/lang/Object;
    if-eqz v0, :cond_c

    .line 689
    const-string v1, "mProxyHost"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Linfo/guardianproject/netcipher/web/WebkitProxy;->setDeclaredField(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 691
    :cond_c
    return-void
.end method

.method private static resetProxyForICS()V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 656
    :try_start_0
    const-string v4, "android.webkit.WebViewCore"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 657
    .local v3, "webViewCoreClass":Ljava/lang/Class;
    const-string v4, "android.net.ProxyProperties"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 658
    .local v2, "proxyPropertiesClass":Ljava/lang/Class;
    if-eqz v3, :cond_3d

    if-eqz v2, :cond_3d

    .line 660
    const-string v4, "sendStaticMessage"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-class v7, Ljava/lang/Object;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 663
    .local v1, "m":Ljava/lang/reflect/Method;
    if-eqz v1, :cond_3d

    .line 665
    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 668
    const/4 v4, 0x0

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const/16 v7, 0xc1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const/4 v7, 0x0

    aput-object v7, v5, v6

    invoke-virtual {v1, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3d
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3d} :catch_3e
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_3d} :catch_5c

    .line 684
    .end local v1    # "m":Ljava/lang/reflect/Method;
    :cond_3d
    return-void

    .line 671
    .end local v2    # "proxyPropertiesClass":Ljava/lang/Class;
    :catch_3e
    move-exception v0

    .line 673
    .local v0, "e":Ljava/lang/Exception;
    const-string v4, "ProxySettings"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Exception setting WebKit proxy through android.net.ProxyProperties: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 676
    throw v0

    .line 677
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_5c
    move-exception v0

    .line 679
    .local v0, "e":Ljava/lang/Error;
    const-string v4, "ProxySettings"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Exception setting WebKit proxy through android.webkit.Network: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/lang/Error;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 682
    throw v0
.end method

.method private static sendProxyChangedIntent(Landroid/content/Context;Ljava/lang/String;I)Z
    .registers 12
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I

    .prologue
    const/4 v8, 0x0

    .line 421
    :try_start_1
    const-string v5, "android.net.ProxyProperties"

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    .line 422
    .local v4, "proxyPropertiesClass":Ljava/lang/Class;
    if-eqz v4, :cond_4b

    .line 424
    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    const-class v7, Ljava/lang/String;

    aput-object v7, v5, v6

    const/4 v6, 0x1

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v5, v6

    const/4 v6, 0x2

    const-class v7, Ljava/lang/String;

    aput-object v7, v5, v6

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 427
    .local v0, "c":Ljava/lang/reflect/Constructor;
    if-eqz v0, :cond_4b

    .line 429
    const/4 v5, 0x1

    invoke-virtual {v0, v5}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    .line 430
    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    const/4 v6, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x2

    const/4 v7, 0x0

    aput-object v7, v5, v6

    invoke-virtual {v0, v5}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 432
    .local v3, "properties":Ljava/lang/Object;
    new-instance v2, Landroid/content/Intent;

    const-string v5, "android.intent.action.PROXY_CHANGE"

    invoke-direct {v2, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 433
    .local v2, "intent":Landroid/content/Intent;
    const-string v5, "proxy"

    check-cast v3, Landroid/os/Parcelable;

    .end local v3    # "properties":Ljava/lang/Object;
    invoke-virtual {v2, v5, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 434
    invoke-virtual {p0, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_4b
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_4b} :catch_4c
    .catch Ljava/lang/Error; {:try_start_1 .. :try_end_4b} :catch_55

    .line 449
    .end local v0    # "c":Ljava/lang/reflect/Constructor;
    .end local v2    # "intent":Landroid/content/Intent;
    .end local v4    # "proxyPropertiesClass":Ljava/lang/Class;
    :cond_4b
    :goto_4b
    return v8

    .line 439
    :catch_4c
    move-exception v1

    .line 441
    .local v1, "e":Ljava/lang/Exception;
    const-string v5, "ProxySettings"

    const-string v6, "Exception sending Intent "

    invoke-static {v5, v6, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_4b

    .line 443
    .end local v1    # "e":Ljava/lang/Exception;
    :catch_55
    move-exception v1

    .line 445
    .local v1, "e":Ljava/lang/Error;
    const-string v5, "ProxySettings"

    const-string v6, "Exception sending Intent "

    invoke-static {v5, v6, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_4b
.end method

.method private static setDeclaredField(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 5
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;,
            Ljava/lang/NoSuchFieldException;,
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 721
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 722
    .local v0, "f":Ljava/lang/reflect/Field;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 723
    invoke-virtual {v0, p0, p2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 724
    return-void
.end method

.method private static setKitKatProxy(Ljava/lang/String;Landroid/content/Context;Ljava/lang/String;I)Z
    .registers 30
    .param p0, "appClass"    # Ljava/lang/String;
    .param p1, "appContext"    # Landroid/content/Context;
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "port"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x13
    .end annotation

    .prologue
    .line 268
    if-eqz p2, :cond_4c

    .line 270
    const-string v22, "http.proxyHost"

    move-object/from16 v0, v22

    move-object/from16 v1, p2

    invoke-static {v0, v1}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 271
    const-string v22, "http.proxyPort"

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v23

    move/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, ""

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v22 .. v23}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 272
    const-string v22, "https.proxyHost"

    move-object/from16 v0, v22

    move-object/from16 v1, p2

    invoke-static {v0, v1}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 273
    const-string v22, "https.proxyPort"

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v23

    move/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, ""

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v22 .. v23}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 277
    :cond_4c
    :try_start_4c
    invoke-static/range {p0 .. p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 278
    .local v3, "applictionCls":Ljava/lang/Class;
    const-string v22, "mLoadedApk"

    move-object/from16 v0, v22

    invoke-virtual {v3, v0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v14

    .line 279
    .local v14, "loadedApkField":Ljava/lang/reflect/Field;
    const/16 v22, 0x1

    move/from16 v0, v22

    invoke-virtual {v14, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 280
    move-object/from16 v0, p1

    invoke-virtual {v14, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    .line 281
    .local v12, "loadedApk":Ljava/lang/Object;
    const-string v22, "android.app.LoadedApk"

    invoke-static/range {v22 .. v22}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v13

    .line 282
    .local v13, "loadedApkCls":Ljava/lang/Class;
    const-string v22, "mReceivers"

    move-object/from16 v0, v22

    invoke-virtual {v13, v0}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v20

    .line 283
    .local v20, "receiversField":Ljava/lang/reflect/Field;
    const/16 v22, 0x1

    move-object/from16 v0, v20

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 284
    move-object/from16 v0, v20

    invoke-virtual {v0, v12}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Landroid/util/ArrayMap;

    .line 285
    .local v19, "receivers":Landroid/util/ArrayMap;
    invoke-virtual/range {v19 .. v19}, Landroid/util/ArrayMap;->values()Ljava/util/Collection;

    move-result-object v22

    invoke-interface/range {v22 .. v22}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_8c
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_181

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    .line 286
    .local v18, "receiverMap":Ljava/lang/Object;
    check-cast v18, Landroid/util/ArrayMap;

    .end local v18    # "receiverMap":Ljava/lang/Object;
    invoke-virtual/range {v18 .. v18}, Landroid/util/ArrayMap;->keySet()Ljava/util/Set;

    move-result-object v22

    invoke-interface/range {v22 .. v22}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, "i$":Ljava/util/Iterator;
    :cond_a0
    :goto_a0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_8c

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    .line 287
    .local v17, "rec":Ljava/lang/Object;
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    .line 288
    .local v4, "clazz":Ljava/lang/Class;
    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v22

    const-string v23, "ProxyChangeListener"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v22

    if-eqz v22, :cond_a0

    .line 289
    const-string v22, "onReceive"

    const/16 v23, 0x2

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    const-class v25, Landroid/content/Context;

    aput-object v25, v23, v24

    const/16 v24, 0x1

    const-class v25, Landroid/content/Intent;

    aput-object v25, v23, v24

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-virtual {v4, v0, v1}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v15

    .line 290
    .local v15, "onReceiveMethod":Ljava/lang/reflect/Method;
    new-instance v11, Landroid/content/Intent;

    const-string v22, "android.intent.action.PROXY_CHANGE"

    move-object/from16 v0, v22

    invoke-direct {v11, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 292
    .local v11, "intent":Landroid/content/Intent;
    if-eqz p2, :cond_13d

    .line 295
    const-string v2, "android.net.ProxyProperties"

    .line 296
    .local v2, "CLASS_NAME":Ljava/lang/String;
    const-string v22, "android.net.ProxyProperties"

    invoke-static/range {v22 .. v22}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    .line 297
    .local v5, "cls":Ljava/lang/Class;
    const/16 v22, 0x3

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    const-class v24, Ljava/lang/String;

    aput-object v24, v22, v23

    const/16 v23, 0x1

    sget-object v24, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v24, v22, v23

    const/16 v23, 0x2

    const-class v24, Ljava/lang/String;

    aput-object v24, v22, v23

    move-object/from16 v0, v22

    invoke-virtual {v5, v0}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v6

    .line 298
    .local v6, "constructor":Ljava/lang/reflect/Constructor;
    const/16 v22, 0x1

    move/from16 v0, v22

    invoke-virtual {v6, v0}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    .line 299
    const/16 v22, 0x3

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    aput-object p2, v22, v23

    const/16 v23, 0x1

    invoke-static/range {p3 .. p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    aput-object v24, v22, v23

    const/16 v23, 0x2

    const/16 v24, 0x0

    aput-object v24, v22, v23

    move-object/from16 v0, v22

    invoke-virtual {v6, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    .line 300
    .local v16, "proxyProperties":Ljava/lang/Object;
    const-string v22, "proxy"

    check-cast v16, Landroid/os/Parcelable;

    .end local v16    # "proxyProperties":Ljava/lang/Object;
    move-object/from16 v0, v22

    move-object/from16 v1, v16

    invoke-virtual {v11, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 304
    .end local v2    # "CLASS_NAME":Ljava/lang/String;
    .end local v5    # "cls":Ljava/lang/Class;
    .end local v6    # "constructor":Ljava/lang/reflect/Constructor;
    :cond_13d
    const/16 v22, 0x2

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    aput-object p1, v22, v23

    const/16 v23, 0x1

    aput-object v11, v22, v23

    move-object/from16 v0, v17

    move-object/from16 v1, v22

    invoke-virtual {v15, v0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_154
    .catch Ljava/lang/ClassNotFoundException; {:try_start_4c .. :try_end_154} :catch_156
    .catch Ljava/lang/NoSuchFieldException; {:try_start_4c .. :try_end_154} :catch_184
    .catch Ljava/lang/IllegalAccessException; {:try_start_4c .. :try_end_154} :catch_1ad
    .catch Ljava/lang/IllegalArgumentException; {:try_start_4c .. :try_end_154} :catch_1d6
    .catch Ljava/lang/NoSuchMethodException; {:try_start_4c .. :try_end_154} :catch_1ff
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_4c .. :try_end_154} :catch_229
    .catch Ljava/lang/InstantiationException; {:try_start_4c .. :try_end_154} :catch_253

    goto/16 :goto_a0

    .line 309
    .end local v3    # "applictionCls":Ljava/lang/Class;
    .end local v4    # "clazz":Ljava/lang/Class;
    .end local v10    # "i$":Ljava/util/Iterator;
    .end local v11    # "intent":Landroid/content/Intent;
    .end local v12    # "loadedApk":Ljava/lang/Object;
    .end local v13    # "loadedApkCls":Ljava/lang/Class;
    .end local v14    # "loadedApkField":Ljava/lang/reflect/Field;
    .end local v15    # "onReceiveMethod":Ljava/lang/reflect/Method;
    .end local v17    # "rec":Ljava/lang/Object;
    .end local v19    # "receivers":Landroid/util/ArrayMap;
    .end local v20    # "receiversField":Ljava/lang/reflect/Field;
    :catch_156
    move-exception v7

    .line 310
    .local v7, "e":Ljava/lang/ClassNotFoundException;
    new-instance v21, Ljava/io/StringWriter;

    invoke-direct/range {v21 .. v21}, Ljava/io/StringWriter;-><init>()V

    .line 311
    .local v21, "sw":Ljava/io/StringWriter;
    new-instance v22, Ljava/io/PrintWriter;

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    move-object/from16 v0, v22

    invoke-virtual {v7, v0}, Ljava/lang/ClassNotFoundException;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 312
    invoke-virtual/range {v21 .. v21}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v8

    .line 313
    .local v8, "exceptionAsString":Ljava/lang/String;
    const-string v22, "OrbotHelpher"

    invoke-virtual {v7}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 314
    const-string v22, "OrbotHelpher"

    move-object/from16 v0, v22

    invoke-static {v0, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 352
    .end local v7    # "e":Ljava/lang/ClassNotFoundException;
    :goto_17e
    const/16 v22, 0x0

    .end local v8    # "exceptionAsString":Ljava/lang/String;
    .end local v21    # "sw":Ljava/io/StringWriter;
    :goto_180
    return v22

    .line 308
    .restart local v3    # "applictionCls":Ljava/lang/Class;
    .restart local v12    # "loadedApk":Ljava/lang/Object;
    .restart local v13    # "loadedApkCls":Ljava/lang/Class;
    .restart local v14    # "loadedApkField":Ljava/lang/reflect/Field;
    .restart local v19    # "receivers":Landroid/util/ArrayMap;
    .restart local v20    # "receiversField":Ljava/lang/reflect/Field;
    :cond_181
    const/16 v22, 0x1

    goto :goto_180

    .line 315
    .end local v3    # "applictionCls":Ljava/lang/Class;
    .end local v12    # "loadedApk":Ljava/lang/Object;
    .end local v13    # "loadedApkCls":Ljava/lang/Class;
    .end local v14    # "loadedApkField":Ljava/lang/reflect/Field;
    .end local v19    # "receivers":Landroid/util/ArrayMap;
    .end local v20    # "receiversField":Ljava/lang/reflect/Field;
    :catch_184
    move-exception v7

    .line 316
    .local v7, "e":Ljava/lang/NoSuchFieldException;
    new-instance v21, Ljava/io/StringWriter;

    invoke-direct/range {v21 .. v21}, Ljava/io/StringWriter;-><init>()V

    .line 317
    .restart local v21    # "sw":Ljava/io/StringWriter;
    new-instance v22, Ljava/io/PrintWriter;

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    move-object/from16 v0, v22

    invoke-virtual {v7, v0}, Ljava/lang/NoSuchFieldException;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 318
    invoke-virtual/range {v21 .. v21}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v8

    .line 319
    .restart local v8    # "exceptionAsString":Ljava/lang/String;
    const-string v22, "OrbotHelpher"

    invoke-virtual {v7}, Ljava/lang/NoSuchFieldException;->getMessage()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 320
    const-string v22, "OrbotHelpher"

    move-object/from16 v0, v22

    invoke-static {v0, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_17e

    .line 321
    .end local v7    # "e":Ljava/lang/NoSuchFieldException;
    .end local v8    # "exceptionAsString":Ljava/lang/String;
    .end local v21    # "sw":Ljava/io/StringWriter;
    :catch_1ad
    move-exception v7

    .line 322
    .local v7, "e":Ljava/lang/IllegalAccessException;
    new-instance v21, Ljava/io/StringWriter;

    invoke-direct/range {v21 .. v21}, Ljava/io/StringWriter;-><init>()V

    .line 323
    .restart local v21    # "sw":Ljava/io/StringWriter;
    new-instance v22, Ljava/io/PrintWriter;

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    move-object/from16 v0, v22

    invoke-virtual {v7, v0}, Ljava/lang/IllegalAccessException;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 324
    invoke-virtual/range {v21 .. v21}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v8

    .line 325
    .restart local v8    # "exceptionAsString":Ljava/lang/String;
    const-string v22, "OrbotHelpher"

    invoke-virtual {v7}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 326
    const-string v22, "OrbotHelpher"

    move-object/from16 v0, v22

    invoke-static {v0, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_17e

    .line 327
    .end local v7    # "e":Ljava/lang/IllegalAccessException;
    .end local v8    # "exceptionAsString":Ljava/lang/String;
    .end local v21    # "sw":Ljava/io/StringWriter;
    :catch_1d6
    move-exception v7

    .line 328
    .local v7, "e":Ljava/lang/IllegalArgumentException;
    new-instance v21, Ljava/io/StringWriter;

    invoke-direct/range {v21 .. v21}, Ljava/io/StringWriter;-><init>()V

    .line 329
    .restart local v21    # "sw":Ljava/io/StringWriter;
    new-instance v22, Ljava/io/PrintWriter;

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    move-object/from16 v0, v22

    invoke-virtual {v7, v0}, Ljava/lang/IllegalArgumentException;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 330
    invoke-virtual/range {v21 .. v21}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v8

    .line 331
    .restart local v8    # "exceptionAsString":Ljava/lang/String;
    const-string v22, "OrbotHelpher"

    invoke-virtual {v7}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 332
    const-string v22, "OrbotHelpher"

    move-object/from16 v0, v22

    invoke-static {v0, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_17e

    .line 333
    .end local v7    # "e":Ljava/lang/IllegalArgumentException;
    .end local v8    # "exceptionAsString":Ljava/lang/String;
    .end local v21    # "sw":Ljava/io/StringWriter;
    :catch_1ff
    move-exception v7

    .line 334
    .local v7, "e":Ljava/lang/NoSuchMethodException;
    new-instance v21, Ljava/io/StringWriter;

    invoke-direct/range {v21 .. v21}, Ljava/io/StringWriter;-><init>()V

    .line 335
    .restart local v21    # "sw":Ljava/io/StringWriter;
    new-instance v22, Ljava/io/PrintWriter;

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    move-object/from16 v0, v22

    invoke-virtual {v7, v0}, Ljava/lang/NoSuchMethodException;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 336
    invoke-virtual/range {v21 .. v21}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v8

    .line 337
    .restart local v8    # "exceptionAsString":Ljava/lang/String;
    const-string v22, "OrbotHelpher"

    invoke-virtual {v7}, Ljava/lang/NoSuchMethodException;->getMessage()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 338
    const-string v22, "OrbotHelpher"

    move-object/from16 v0, v22

    invoke-static {v0, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_17e

    .line 339
    .end local v7    # "e":Ljava/lang/NoSuchMethodException;
    .end local v8    # "exceptionAsString":Ljava/lang/String;
    .end local v21    # "sw":Ljava/io/StringWriter;
    :catch_229
    move-exception v7

    .line 340
    .local v7, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v21, Ljava/io/StringWriter;

    invoke-direct/range {v21 .. v21}, Ljava/io/StringWriter;-><init>()V

    .line 341
    .restart local v21    # "sw":Ljava/io/StringWriter;
    new-instance v22, Ljava/io/PrintWriter;

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    move-object/from16 v0, v22

    invoke-virtual {v7, v0}, Ljava/lang/reflect/InvocationTargetException;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 342
    invoke-virtual/range {v21 .. v21}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v8

    .line 343
    .restart local v8    # "exceptionAsString":Ljava/lang/String;
    const-string v22, "OrbotHelpher"

    invoke-virtual {v7}, Ljava/lang/reflect/InvocationTargetException;->getMessage()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 344
    const-string v22, "OrbotHelpher"

    move-object/from16 v0, v22

    invoke-static {v0, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_17e

    .line 345
    .end local v7    # "e":Ljava/lang/reflect/InvocationTargetException;
    .end local v8    # "exceptionAsString":Ljava/lang/String;
    .end local v21    # "sw":Ljava/io/StringWriter;
    :catch_253
    move-exception v7

    .line 346
    .local v7, "e":Ljava/lang/InstantiationException;
    new-instance v21, Ljava/io/StringWriter;

    invoke-direct/range {v21 .. v21}, Ljava/io/StringWriter;-><init>()V

    .line 347
    .restart local v21    # "sw":Ljava/io/StringWriter;
    new-instance v22, Ljava/io/PrintWriter;

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    move-object/from16 v0, v22

    invoke-virtual {v7, v0}, Ljava/lang/InstantiationException;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 348
    invoke-virtual/range {v21 .. v21}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v8

    .line 349
    .restart local v8    # "exceptionAsString":Ljava/lang/String;
    const-string v22, "OrbotHelpher"

    invoke-virtual {v7}, Ljava/lang/InstantiationException;->getMessage()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 350
    const-string v22, "OrbotHelpher"

    move-object/from16 v0, v22

    invoke-static {v0, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_17e
.end method

.method public static setProxy(Ljava/lang/String;Landroid/content/Context;Landroid/webkit/WebView;Ljava/lang/String;I)Z
    .registers 8
    .param p0, "appClass"    # Ljava/lang/String;
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "wView"    # Landroid/webkit/WebView;
    .param p3, "host"    # Ljava/lang/String;
    .param p4, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 44
    invoke-static {p3, p4}, Linfo/guardianproject/netcipher/web/WebkitProxy;->setSystemProperties(Ljava/lang/String;I)V

    .line 46
    const/4 v0, 0x0

    .line 48
    .local v0, "worked":Z
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xd

    if-ge v1, v2, :cond_e

    .line 51
    invoke-static {p2, p3, p4}, Linfo/guardianproject/netcipher/web/WebkitProxy;->setProxyUpToHC(Landroid/webkit/WebView;Ljava/lang/String;I)Z

    .line 71
    :cond_d
    :goto_d
    return v0

    .line 53
    :cond_e
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x13

    if-ge v1, v2, :cond_19

    .line 55
    invoke-static {p1, p3, p4}, Linfo/guardianproject/netcipher/web/WebkitProxy;->setWebkitProxyICS(Landroid/content/Context;Ljava/lang/String;I)Z

    move-result v0

    goto :goto_d

    .line 57
    :cond_19
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x14

    if-ge v1, v2, :cond_2a

    .line 59
    invoke-static {p0, p1, p3, p4}, Linfo/guardianproject/netcipher/web/WebkitProxy;->setKitKatProxy(Ljava/lang/String;Landroid/content/Context;Ljava/lang/String;I)Z

    move-result v0

    .line 61
    if-nez v0, :cond_d

    .line 62
    invoke-static {p1, p3, p4}, Linfo/guardianproject/netcipher/web/WebkitProxy;->setWebkitProxyICS(Landroid/content/Context;Ljava/lang/String;I)Z

    move-result v0

    goto :goto_d

    .line 65
    :cond_2a
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_d

    .line 67
    invoke-static {p1, p3, p4}, Linfo/guardianproject/netcipher/web/WebkitProxy;->setWebkitProxyLollipop(Landroid/content/Context;Ljava/lang/String;I)Z

    move-result v0

    goto :goto_d
.end method

.method private static setProxyUpToHC(Landroid/webkit/WebView;Ljava/lang/String;I)Z
    .registers 19
    .param p0, "webview"    # Landroid/webkit/WebView;
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I

    .prologue
    .line 140
    const-string v12, "OrbotHelpher"

    const-string v13, "Setting proxy with <= 3.2 API."

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 142
    new-instance v7, Lorg/apache/http/HttpHost;

    move-object/from16 v0, p1

    move/from16 v1, p2

    invoke-direct {v7, v0, v1}, Lorg/apache/http/HttpHost;-><init>(Ljava/lang/String;I)V

    .line 144
    .local v7, "proxyServer":Lorg/apache/http/HttpHost;
    const/4 v5, 0x0

    .line 145
    .local v5, "networkClass":Ljava/lang/Class;
    const/4 v4, 0x0

    .line 147
    .local v4, "network":Ljava/lang/Object;
    :try_start_12
    const-string v12, "android.webkit.Network"

    invoke-static {v12}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    .line 148
    if-nez v5, :cond_23

    .line 149
    const-string v12, "OrbotHelpher"

    const-string v13, "failed to get class for android.webkit.Network"

    invoke-static {v12, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    const/4 v12, 0x0

    .line 199
    .end local v4    # "network":Ljava/lang/Object;
    :goto_22
    return v12

    .line 152
    .restart local v4    # "network":Ljava/lang/Object;
    :cond_23
    const-string v12, "getInstance"

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Class;

    const/4 v14, 0x0

    const-class v15, Landroid/content/Context;

    aput-object v15, v13, v14

    invoke-virtual {v5, v12, v13}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 153
    .local v3, "getInstanceMethod":Ljava/lang/reflect/Method;
    if-nez v3, :cond_3a

    .line 154
    const-string v12, "OrbotHelpher"

    const-string v13, "failed to get getInstance method"

    invoke-static {v12, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    :cond_3a
    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    invoke-virtual/range {p0 .. p0}, Landroid/webkit/WebView;->getContext()Landroid/content/Context;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-virtual {v3, v5, v12}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_47
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_47} :catch_53

    move-result-object v4

    .line 161
    if-nez v4, :cond_6e

    .line 162
    const-string v12, "OrbotHelpher"

    const-string v13, "error getting network: network is null"

    invoke-static {v12, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 163
    const/4 v12, 0x0

    goto :goto_22

    .line 157
    .end local v3    # "getInstanceMethod":Ljava/lang/reflect/Method;
    :catch_53
    move-exception v2

    .line 158
    .local v2, "ex":Ljava/lang/Exception;
    const-string v12, "OrbotHelpher"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "error getting network: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 159
    const/4 v12, 0x0

    goto :goto_22

    .line 165
    .end local v2    # "ex":Ljava/lang/Exception;
    .restart local v3    # "getInstanceMethod":Ljava/lang/reflect/Method;
    :cond_6e
    const/4 v8, 0x0

    .line 167
    .local v8, "requestQueue":Ljava/lang/Object;
    :try_start_6f
    const-string v12, "mRequestQueue"

    invoke-virtual {v5, v12}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v10

    .line 169
    .local v10, "requestQueueField":Ljava/lang/reflect/Field;
    invoke-static {v10, v4}, Linfo/guardianproject/netcipher/web/WebkitProxy;->getFieldValueSafely(Ljava/lang/reflect/Field;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_78
    .catch Ljava/lang/Exception; {:try_start_6f .. :try_end_78} :catch_84

    move-result-object v8

    .line 174
    if-nez v8, :cond_8e

    .line 175
    const-string v12, "OrbotHelpher"

    const-string v13, "Request queue is null"

    invoke-static {v12, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 176
    const/4 v12, 0x0

    goto :goto_22

    .line 170
    .end local v10    # "requestQueueField":Ljava/lang/reflect/Field;
    :catch_84
    move-exception v2

    .line 171
    .restart local v2    # "ex":Ljava/lang/Exception;
    const-string v12, "OrbotHelpher"

    const-string v13, "error getting field value"

    invoke-static {v12, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 172
    const/4 v12, 0x0

    goto :goto_22

    .line 178
    .end local v2    # "ex":Ljava/lang/Exception;
    .restart local v10    # "requestQueueField":Ljava/lang/reflect/Field;
    :cond_8e
    const/4 v6, 0x0

    .line 180
    .local v6, "proxyHostField":Ljava/lang/reflect/Field;
    :try_start_8f
    const-string v12, "android.net.http.RequestQueue"

    invoke-static {v12}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    .line 181
    .local v9, "requestQueueClass":Ljava/lang/Class;
    const-string v12, "mProxyHost"

    invoke-virtual {v9, v12}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;
    :try_end_9a
    .catch Ljava/lang/Exception; {:try_start_8f .. :try_end_9a} :catch_b3

    move-result-object v6

    .line 188
    invoke-virtual {v6}, Ljava/lang/reflect/Field;->isAccessible()Z

    move-result v11

    .line 190
    .local v11, "temp":Z
    const/4 v12, 0x1

    :try_start_a0
    invoke-virtual {v6, v12}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 191
    invoke-virtual {v6, v8, v7}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_a6
    .catch Ljava/lang/Exception; {:try_start_a0 .. :try_end_a6} :catch_be
    .catchall {:try_start_a0 .. :try_end_a6} :catchall_ca

    .line 195
    invoke-virtual {v6, v11}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 198
    :goto_a9
    const-string v12, "OrbotHelpher"

    const-string v13, "Setting proxy with <= 3.2 API successful!"

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 199
    const/4 v12, 0x1

    goto/16 :goto_22

    .line 183
    .end local v9    # "requestQueueClass":Ljava/lang/Class;
    .end local v11    # "temp":Z
    :catch_b3
    move-exception v2

    .line 184
    .restart local v2    # "ex":Ljava/lang/Exception;
    const-string v12, "OrbotHelpher"

    const-string v13, "error getting proxy host field"

    invoke-static {v12, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 185
    const/4 v12, 0x0

    goto/16 :goto_22

    .line 192
    .end local v2    # "ex":Ljava/lang/Exception;
    .restart local v9    # "requestQueueClass":Ljava/lang/Class;
    .restart local v11    # "temp":Z
    :catch_be
    move-exception v2

    .line 193
    .restart local v2    # "ex":Ljava/lang/Exception;
    :try_start_bf
    const-string v12, "OrbotHelpher"

    const-string v13, "error setting proxy host"

    invoke-static {v12, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_c6
    .catchall {:try_start_bf .. :try_end_c6} :catchall_ca

    .line 195
    invoke-virtual {v6, v11}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    goto :goto_a9

    .end local v2    # "ex":Ljava/lang/Exception;
    :catchall_ca
    move-exception v12

    invoke-virtual {v6, v11}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    throw v12
.end method

.method private static setSystemProperties(Ljava/lang/String;I)V
    .registers 5
    .param p0, "host"    # Ljava/lang/String;
    .param p1, "port"    # I

    .prologue
    .line 77
    const-string v0, "proxyHost"

    invoke-static {v0, p0}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 78
    const-string v0, "proxyPort"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 80
    const-string v0, "http.proxyHost"

    invoke-static {v0, p0}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 81
    const-string v0, "http.proxyPort"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 83
    const-string v0, "https.proxyHost"

    invoke-static {v0, p0}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 84
    const-string v0, "https.proxyPort"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 87
    const-string v0, "socks.proxyHost"

    invoke-static {v0, p0}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 88
    const-string v0, "socks.proxyPort"

    const-string v1, "9050"

    invoke-static {v0, v1}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 90
    const-string v0, "socksProxyHost"

    invoke-static {v0, p0}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 91
    const-string v0, "socksProxyPort"

    const-string v1, "9050"

    invoke-static {v0, v1}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 107
    return-void
.end method

.method private static setWebkitProxyGingerbread(Landroid/content/Context;Ljava/lang/String;I)Z
    .registers 7
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 121
    const/4 v2, 0x0

    .line 123
    .local v2, "ret":Z
    invoke-static {p0}, Linfo/guardianproject/netcipher/web/WebkitProxy;->getRequestQueue(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v1

    .line 124
    .local v1, "requestQueueObject":Ljava/lang/Object;
    if-eqz v1, :cond_15

    .line 126
    new-instance v0, Lorg/apache/http/HttpHost;

    const-string v3, "http"

    invoke-direct {v0, p1, p2, v3}, Lorg/apache/http/HttpHost;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 127
    .local v0, "httpHost":Lorg/apache/http/HttpHost;
    const-string v3, "mProxyHost"

    invoke-static {v1, v3, v0}, Linfo/guardianproject/netcipher/web/WebkitProxy;->setDeclaredField(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 128
    const/4 v3, 0x1

    .line 130
    .end local v0    # "httpHost":Lorg/apache/http/HttpHost;
    :goto_14
    return v3

    :cond_15
    const/4 v3, 0x0

    goto :goto_14
.end method

.method private static setWebkitProxyICS(Landroid/content/Context;Ljava/lang/String;I)Z
    .registers 15
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 217
    :try_start_2
    const-string v8, "android.webkit.WebViewCore"

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    .line 219
    .local v5, "webViewCoreClass":Ljava/lang/Class;
    const-string v8, "android.net.ProxyProperties"

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    .line 220
    .local v4, "proxyPropertiesClass":Ljava/lang/Class;
    if-eqz v5, :cond_8d

    if-eqz v4, :cond_8d

    .line 222
    const-string v8, "sendStaticMessage"

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Class;

    const/4 v10, 0x0

    sget-object v11, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v11, v9, v10

    const/4 v10, 0x1

    const-class v11, Ljava/lang/Object;

    aput-object v11, v9, v10

    invoke-virtual {v5, v8, v9}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 224
    .local v2, "m":Ljava/lang/reflect/Method;
    const/4 v8, 0x3

    new-array v8, v8, [Ljava/lang/Class;

    const/4 v9, 0x0

    const-class v10, Ljava/lang/String;

    aput-object v10, v8, v9

    const/4 v9, 0x1

    sget-object v10, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v10, v8, v9

    const/4 v9, 0x2

    const-class v10, Ljava/lang/String;

    aput-object v10, v8, v9

    invoke-virtual {v4, v8}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 227
    .local v0, "c":Ljava/lang/reflect/Constructor;
    if-eqz v2, :cond_8d

    if-eqz v0, :cond_8d

    .line 229
    const/4 v8, 0x1

    invoke-virtual {v2, v8}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 230
    const/4 v8, 0x1

    invoke-virtual {v0, v8}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    .line 231
    const/4 v8, 0x3

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object p1, v8, v9

    const/4 v9, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x2

    const/4 v10, 0x0

    aput-object v10, v8, v9

    invoke-virtual {v0, v8}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 234
    .local v3, "properties":Ljava/lang/Object;
    const/4 v8, 0x0

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    const/16 v11, 0xc1

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x1

    aput-object v3, v9, v10

    invoke-virtual {v2, v8, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_6f
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_6f} :catch_70
    .catch Ljava/lang/Error; {:try_start_2 .. :try_end_6f} :catch_8f

    .line 254
    .end local v0    # "c":Ljava/lang/reflect/Constructor;
    .end local v2    # "m":Ljava/lang/reflect/Method;
    .end local v3    # "properties":Ljava/lang/Object;
    .end local v4    # "proxyPropertiesClass":Ljava/lang/Class;
    .end local v5    # "webViewCoreClass":Ljava/lang/Class;
    :goto_6f
    return v6

    .line 242
    :catch_70
    move-exception v1

    .line 244
    .local v1, "e":Ljava/lang/Exception;
    const-string v6, "ProxySettings"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Exception setting WebKit proxy through android.net.ProxyProperties: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .end local v1    # "e":Ljava/lang/Exception;
    :cond_8d
    :goto_8d
    move v6, v7

    .line 254
    goto :goto_6f

    .line 247
    :catch_8f
    move-exception v1

    .line 249
    .local v1, "e":Ljava/lang/Error;
    const-string v6, "ProxySettings"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Exception setting WebKit proxy through android.webkit.Network: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v1}, Ljava/lang/Error;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_8d
.end method

.method private static setWebkitProxyLollipop(Landroid/content/Context;Ljava/lang/String;I)Z
    .registers 23
    .param p0, "appContext"    # Landroid/content/Context;
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 365
    const-string v16, "http.proxyHost"

    move-object/from16 v0, v16

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 366
    const-string v16, "http.proxyPort"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v17

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, ""

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 367
    const-string v16, "https.proxyHost"

    move-object/from16 v0, v16

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 368
    const-string v16, "https.proxyPort"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v17

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, ""

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 370
    :try_start_4a
    const-string v16, "android.app.Application"

    invoke-static/range {v16 .. v16}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 371
    .local v2, "applictionClass":Ljava/lang/Class;
    const-string v16, "mLoadedApk"

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v9

    .line 372
    .local v9, "mLoadedApkField":Ljava/lang/reflect/Field;
    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v9, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 373
    move-object/from16 v0, p0

    invoke-virtual {v9, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    .line 374
    .local v11, "mloadedApk":Ljava/lang/Object;
    const-string v16, "android.app.LoadedApk"

    invoke-static/range {v16 .. v16}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    .line 375
    .local v8, "loadedApkClass":Ljava/lang/Class;
    const-string v16, "mReceivers"

    move-object/from16 v0, v16

    invoke-virtual {v8, v0}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v10

    .line 376
    .local v10, "mReceiversField":Ljava/lang/reflect/Field;
    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v10, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 377
    invoke-virtual {v10, v11}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/util/ArrayMap;

    .line 378
    .local v15, "receivers":Landroid/util/ArrayMap;
    invoke-virtual {v15}, Landroid/util/ArrayMap;->values()Ljava/util/Collection;

    move-result-object v16

    invoke-interface/range {v16 .. v16}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_88
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_113

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    .line 380
    .local v14, "receiverMap":Ljava/lang/Object;
    check-cast v14, Landroid/util/ArrayMap;

    .end local v14    # "receiverMap":Ljava/lang/Object;
    invoke-virtual {v14}, Landroid/util/ArrayMap;->keySet()Ljava/util/Set;

    move-result-object v16

    invoke-interface/range {v16 .. v16}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :cond_9c
    :goto_9c
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_88

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    .line 382
    .local v13, "receiver":Ljava/lang/Object;
    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    .line 383
    .local v3, "clazz":Ljava/lang/Class;
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v16

    const-string v17, "ProxyChangeListener"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v16

    if-eqz v16, :cond_9c

    .line 385
    const-string v16, "onReceive"

    const/16 v17, 0x2

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    const-class v19, Landroid/content/Context;

    aput-object v19, v17, v18

    const/16 v18, 0x1

    const-class v19, Landroid/content/Intent;

    aput-object v19, v17, v18

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-virtual {v3, v0, v1}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v12

    .line 386
    .local v12, "onReceiveMethod":Ljava/lang/reflect/Method;
    new-instance v7, Landroid/content/Intent;

    const-string v16, "android.intent.action.PROXY_CHANGE"

    move-object/from16 v0, v16

    invoke-direct {v7, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 387
    .local v7, "intent":Landroid/content/Intent;
    const/16 v16, 0x2

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    aput-object p0, v16, v17

    const/16 v17, 0x1

    aput-object v7, v16, v17

    move-object/from16 v0, v16

    invoke-virtual {v12, v13, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_f2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_4a .. :try_end_f2} :catch_f3
    .catch Ljava/lang/NoSuchFieldException; {:try_start_4a .. :try_end_f2} :catch_116
    .catch Ljava/lang/IllegalAccessException; {:try_start_4a .. :try_end_f2} :catch_134
    .catch Ljava/lang/NoSuchMethodException; {:try_start_4a .. :try_end_f2} :catch_152
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_4a .. :try_end_f2} :catch_170

    goto :goto_9c

    .line 393
    .end local v2    # "applictionClass":Ljava/lang/Class;
    .end local v3    # "clazz":Ljava/lang/Class;
    .end local v6    # "i$":Ljava/util/Iterator;
    .end local v7    # "intent":Landroid/content/Intent;
    .end local v8    # "loadedApkClass":Ljava/lang/Class;
    .end local v9    # "mLoadedApkField":Ljava/lang/reflect/Field;
    .end local v10    # "mReceiversField":Ljava/lang/reflect/Field;
    .end local v11    # "mloadedApk":Ljava/lang/Object;
    .end local v12    # "onReceiveMethod":Ljava/lang/reflect/Method;
    .end local v13    # "receiver":Ljava/lang/Object;
    .end local v15    # "receivers":Landroid/util/ArrayMap;
    :catch_f3
    move-exception v4

    .line 395
    .local v4, "e":Ljava/lang/ClassNotFoundException;
    const-string v16, "ProxySettings"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Exception setting WebKit proxy on Lollipop through ProxyChangeListener: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual {v4}, Ljava/lang/ClassNotFoundException;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 413
    .end local v4    # "e":Ljava/lang/ClassNotFoundException;
    :goto_110
    const/16 v16, 0x0

    :goto_112
    return v16

    .line 391
    .restart local v2    # "applictionClass":Ljava/lang/Class;
    .restart local v8    # "loadedApkClass":Ljava/lang/Class;
    .restart local v9    # "mLoadedApkField":Ljava/lang/reflect/Field;
    .restart local v10    # "mReceiversField":Ljava/lang/reflect/Field;
    .restart local v11    # "mloadedApk":Ljava/lang/Object;
    .restart local v15    # "receivers":Landroid/util/ArrayMap;
    :cond_113
    const/16 v16, 0x1

    goto :goto_112

    .line 397
    .end local v2    # "applictionClass":Ljava/lang/Class;
    .end local v8    # "loadedApkClass":Ljava/lang/Class;
    .end local v9    # "mLoadedApkField":Ljava/lang/reflect/Field;
    .end local v10    # "mReceiversField":Ljava/lang/reflect/Field;
    .end local v11    # "mloadedApk":Ljava/lang/Object;
    .end local v15    # "receivers":Landroid/util/ArrayMap;
    :catch_116
    move-exception v4

    .line 399
    .local v4, "e":Ljava/lang/NoSuchFieldException;
    const-string v16, "ProxySettings"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Exception setting WebKit proxy on Lollipop through ProxyChangeListener: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual {v4}, Ljava/lang/NoSuchFieldException;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_110

    .line 401
    .end local v4    # "e":Ljava/lang/NoSuchFieldException;
    :catch_134
    move-exception v4

    .line 403
    .local v4, "e":Ljava/lang/IllegalAccessException;
    const-string v16, "ProxySettings"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Exception setting WebKit proxy on Lollipop through ProxyChangeListener: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual {v4}, Ljava/lang/IllegalAccessException;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_110

    .line 405
    .end local v4    # "e":Ljava/lang/IllegalAccessException;
    :catch_152
    move-exception v4

    .line 407
    .local v4, "e":Ljava/lang/NoSuchMethodException;
    const-string v16, "ProxySettings"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Exception setting WebKit proxy on Lollipop through ProxyChangeListener: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual {v4}, Ljava/lang/NoSuchMethodException;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_110

    .line 409
    .end local v4    # "e":Ljava/lang/NoSuchMethodException;
    :catch_170
    move-exception v4

    .line 411
    .local v4, "e":Ljava/lang/reflect/InvocationTargetException;
    const-string v16, "ProxySettings"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Exception setting WebKit proxy on Lollipop through ProxyChangeListener: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual {v4}, Ljava/lang/reflect/InvocationTargetException;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_110
.end method

.method private static showDownloadDialog(Landroid/app/Activity;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/app/AlertDialog;
    .registers 7
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "stringTitle"    # Ljava/lang/CharSequence;
    .param p2, "stringMessage"    # Ljava/lang/CharSequence;
    .param p3, "stringButtonYes"    # Ljava/lang/CharSequence;
    .param p4, "stringButtonNo"    # Ljava/lang/CharSequence;

    .prologue
    .line 781
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 782
    .local v0, "downloadDialog":Landroid/app/AlertDialog$Builder;
    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 783
    invoke-virtual {v0, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 784
    new-instance v1, Linfo/guardianproject/netcipher/web/WebkitProxy$1;

    invoke-direct {v1, p0}, Linfo/guardianproject/netcipher/web/WebkitProxy$1;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0, p3, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 791
    new-instance v1, Linfo/guardianproject/netcipher/web/WebkitProxy$2;

    invoke-direct {v1}, Linfo/guardianproject/netcipher/web/WebkitProxy$2;-><init>()V

    invoke-virtual {v0, p4, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 795
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v1

    return-object v1
.end method
