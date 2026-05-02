.class public Lorg/openintents/openpgp/util/OpenPgpApi;
.super Ljava/lang/Object;
.source "OpenPgpApi.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/openintents/openpgp/util/OpenPgpApi$1;,
        Lorg/openintents/openpgp/util/OpenPgpApi$OpenPgpAsyncTask;,
        Lorg/openintents/openpgp/util/OpenPgpApi$IOpenPgpCallback;
    }
.end annotation


# static fields
.field public static final ACTION_CLEARTEXT_SIGN:Ljava/lang/String; = "org.openintents.openpgp.action.CLEARTEXT_SIGN"

.field public static final ACTION_DECRYPT_METADATA:Ljava/lang/String; = "org.openintents.openpgp.action.DECRYPT_METADATA"

.field public static final ACTION_DECRYPT_VERIFY:Ljava/lang/String; = "org.openintents.openpgp.action.DECRYPT_VERIFY"

.field public static final ACTION_DETACHED_SIGN:Ljava/lang/String; = "org.openintents.openpgp.action.DETACHED_SIGN"

.field public static final ACTION_ENCRYPT:Ljava/lang/String; = "org.openintents.openpgp.action.ENCRYPT"

.field public static final ACTION_GET_KEY:Ljava/lang/String; = "org.openintents.openpgp.action.GET_KEY"

.field public static final ACTION_GET_KEY_IDS:Ljava/lang/String; = "org.openintents.openpgp.action.GET_KEY_IDS"

.field public static final ACTION_GET_SIGN_KEY_ID:Ljava/lang/String; = "org.openintents.openpgp.action.GET_SIGN_KEY_ID"

.field public static final ACTION_SIGN:Ljava/lang/String; = "org.openintents.openpgp.action.SIGN"

.field public static final ACTION_SIGN_AND_ENCRYPT:Ljava/lang/String; = "org.openintents.openpgp.action.SIGN_AND_ENCRYPT"

.field public static final API_VERSION:I = 0x9

.field public static final EXTRA_ACCOUNT_NAME:Ljava/lang/String; = "account_name"

.field public static final EXTRA_API_VERSION:Ljava/lang/String; = "api_version"

.field public static final EXTRA_CALL_UUID1:Ljava/lang/String; = "call_uuid1"

.field public static final EXTRA_CALL_UUID2:Ljava/lang/String; = "call_uuid2"

.field public static final EXTRA_DETACHED_SIGNATURE:Ljava/lang/String; = "detached_signature"

.field public static final EXTRA_ENABLE_COMPRESSION:Ljava/lang/String; = "enable_compression"

.field public static final EXTRA_KEY_ID:Ljava/lang/String; = "key_id"

.field public static final EXTRA_KEY_IDS:Ljava/lang/String; = "key_ids"

.field public static final EXTRA_ORIGINAL_FILENAME:Ljava/lang/String; = "original_filename"

.field public static final EXTRA_PASSPHRASE:Ljava/lang/String; = "passphrase"

.field public static final EXTRA_REQUEST_ASCII_ARMOR:Ljava/lang/String; = "ascii_armor"

.field public static final EXTRA_SIGN_KEY_ID:Ljava/lang/String; = "sign_key_id"

.field public static final EXTRA_USER_ID:Ljava/lang/String; = "user_id"

.field public static final EXTRA_USER_IDS:Ljava/lang/String; = "user_ids"

.field public static final RESULT_CHARSET:Ljava/lang/String; = "charset"

.field public static final RESULT_CODE:Ljava/lang/String; = "result_code"

.field public static final RESULT_CODE_ERROR:I = 0x0

.field public static final RESULT_CODE_SUCCESS:I = 0x1

.field public static final RESULT_CODE_USER_INTERACTION_REQUIRED:I = 0x2

.field public static final RESULT_DECRYPTION:Ljava/lang/String; = "decryption"

.field public static final RESULT_DETACHED_SIGNATURE:Ljava/lang/String; = "detached_signature"

.field public static final RESULT_ERROR:Ljava/lang/String; = "error"

.field public static final RESULT_INTENT:Ljava/lang/String; = "intent"

.field public static final RESULT_KEY_IDS:Ljava/lang/String; = "key_ids"

.field public static final RESULT_METADATA:Ljava/lang/String; = "metadata"

.field public static final RESULT_SIGNATURE:Ljava/lang/String; = "signature"

.field public static final SERVICE_INTENT_2:Ljava/lang/String; = "org.openintents.openpgp.IOpenPgpService2"

.field public static final TAG:Ljava/lang/String; = "OpenPgp API"


# instance fields
.field mContext:Landroid/content/Context;

.field final mPipeIdGen:Ljava/util/concurrent/atomic/AtomicInteger;

.field mService:Lorg/openintents/openpgp/IOpenPgpService2;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lorg/openintents/openpgp/IOpenPgpService2;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "service"    # Lorg/openintents/openpgp/IOpenPgpService2;

    .prologue
    .line 261
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 259
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lorg/openintents/openpgp/util/OpenPgpApi;->mPipeIdGen:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 262
    iput-object p1, p0, Lorg/openintents/openpgp/util/OpenPgpApi;->mContext:Landroid/content/Context;

    .line 263
    iput-object p2, p0, Lorg/openintents/openpgp/util/OpenPgpApi;->mService:Lorg/openintents/openpgp/IOpenPgpService2;

    .line 264
    return-void
.end method


# virtual methods
.method public executeApi(Landroid/content/Intent;Ljava/io/InputStream;Ljava/io/OutputStream;)Landroid/content/Intent;
    .registers 14
    .param p1, "data"    # Landroid/content/Intent;
    .param p2, "is"    # Ljava/io/InputStream;
    .param p3, "os"    # Ljava/io/OutputStream;

    .prologue
    .line 311
    const/4 v1, 0x0

    .line 312
    .local v1, "input":Landroid/os/ParcelFileDescriptor;
    const/4 v2, 0x0

    .line 315
    .local v2, "output":Landroid/os/ParcelFileDescriptor;
    :try_start_2
    const-string v6, "api_version"

    const/16 v7, 0x9

    invoke-virtual {p1, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 319
    if-eqz p2, :cond_f

    .line 320
    invoke-static {p2}, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil;->pipeFrom(Ljava/io/InputStream;)Landroid/os/ParcelFileDescriptor;

    move-result-object v1

    .line 323
    :cond_f
    const/4 v4, 0x0

    .line 324
    .local v4, "pumpThread":Ljava/lang/Thread;
    const/4 v3, 0x0

    .line 326
    .local v3, "outputPipeId":I
    if-eqz p3, :cond_23

    .line 327
    iget-object v6, p0, Lorg/openintents/openpgp/util/OpenPgpApi;->mPipeIdGen:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v3

    .line 328
    iget-object v6, p0, Lorg/openintents/openpgp/util/OpenPgpApi;->mService:Lorg/openintents/openpgp/IOpenPgpService2;

    invoke-interface {v6, v3}, Lorg/openintents/openpgp/IOpenPgpService2;->createOutputPipe(I)Landroid/os/ParcelFileDescriptor;

    move-result-object v2

    .line 329
    invoke-static {p3, v2}, Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil;->pipeTo(Ljava/io/OutputStream;Landroid/os/ParcelFileDescriptor;)Lorg/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread;

    move-result-object v4

    .line 333
    :cond_23
    iget-object v6, p0, Lorg/openintents/openpgp/util/OpenPgpApi;->mService:Lorg/openintents/openpgp/IOpenPgpService2;

    invoke-interface {v6, p1, v1, v3}, Lorg/openintents/openpgp/IOpenPgpService2;->execute(Landroid/content/Intent;Landroid/os/ParcelFileDescriptor;I)Landroid/content/Intent;

    move-result-object v5

    .line 338
    .local v5, "result":Landroid/content/Intent;
    iget-object v6, p0, Lorg/openintents/openpgp/util/OpenPgpApi;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/content/Intent;->setExtrasClassLoader(Ljava/lang/ClassLoader;)V

    .line 341
    if-eqz v4, :cond_37

    .line 342
    invoke-virtual {v4}, Ljava/lang/Thread;->join()V
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_37} :catch_54
    .catchall {:try_start_2 .. :try_end_37} :catchall_93

    .line 355
    :cond_37
    if-eqz v2, :cond_3c

    .line 357
    :try_start_39
    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_3c
    .catch Ljava/io/IOException; {:try_start_39 .. :try_end_3c} :catch_42

    .line 362
    :cond_3c
    :goto_3c
    if-eqz v1, :cond_41

    .line 364
    :try_start_3e
    invoke-virtual {v1}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_41
    .catch Ljava/io/IOException; {:try_start_3e .. :try_end_41} :catch_4b

    .line 367
    .end local v3    # "outputPipeId":I
    .end local v4    # "pumpThread":Ljava/lang/Thread;
    :cond_41
    :goto_41
    return-object v5

    .line 358
    .restart local v3    # "outputPipeId":I
    .restart local v4    # "pumpThread":Ljava/lang/Thread;
    :catch_42
    move-exception v0

    .line 359
    .local v0, "e":Ljava/io/IOException;
    const-string v6, "OpenPgp API"

    const-string v7, "IOException when closing ParcelFileDescriptor!"

    invoke-static {v6, v7, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_3c

    .line 365
    .end local v0    # "e":Ljava/io/IOException;
    :catch_4b
    move-exception v0

    .line 366
    .restart local v0    # "e":Ljava/io/IOException;
    const-string v6, "OpenPgp API"

    const-string v7, "IOException when closing ParcelFileDescriptor!"

    invoke-static {v6, v7, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_41

    .line 346
    .end local v0    # "e":Ljava/io/IOException;
    .end local v3    # "outputPipeId":I
    .end local v4    # "pumpThread":Ljava/lang/Thread;
    .end local v5    # "result":Landroid/content/Intent;
    :catch_54
    move-exception v0

    .line 347
    .local v0, "e":Ljava/lang/Exception;
    :try_start_55
    const-string v6, "OpenPgp API"

    const-string v7, "Exception in executeApi call"

    invoke-static {v6, v7, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 348
    new-instance v5, Landroid/content/Intent;

    invoke-direct {v5}, Landroid/content/Intent;-><init>()V

    .line 349
    .restart local v5    # "result":Landroid/content/Intent;
    const-string v6, "result_code"

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 350
    const-string v6, "error"

    new-instance v7, Lorg/openintents/openpgp/OpenPgpError;

    const/4 v8, -0x1

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v7, v8, v9}, Lorg/openintents/openpgp/OpenPgpError;-><init>(ILjava/lang/String;)V

    invoke-virtual {v5, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;
    :try_end_76
    .catchall {:try_start_55 .. :try_end_76} :catchall_93

    .line 355
    if-eqz v2, :cond_7b

    .line 357
    :try_start_78
    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_7b
    .catch Ljava/io/IOException; {:try_start_78 .. :try_end_7b} :catch_8a

    .line 362
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_7b
    :goto_7b
    if-eqz v1, :cond_41

    .line 364
    :try_start_7d
    invoke-virtual {v1}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_80
    .catch Ljava/io/IOException; {:try_start_7d .. :try_end_80} :catch_81

    goto :goto_41

    .line 365
    :catch_81
    move-exception v0

    .line 366
    .local v0, "e":Ljava/io/IOException;
    const-string v6, "OpenPgp API"

    const-string v7, "IOException when closing ParcelFileDescriptor!"

    invoke-static {v6, v7, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_41

    .line 358
    .local v0, "e":Ljava/lang/Exception;
    :catch_8a
    move-exception v0

    .line 359
    .local v0, "e":Ljava/io/IOException;
    const-string v6, "OpenPgp API"

    const-string v7, "IOException when closing ParcelFileDescriptor!"

    invoke-static {v6, v7, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_7b

    .line 355
    .end local v0    # "e":Ljava/io/IOException;
    .end local v5    # "result":Landroid/content/Intent;
    :catchall_93
    move-exception v6

    if-eqz v2, :cond_99

    .line 357
    :try_start_96
    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_99
    .catch Ljava/io/IOException; {:try_start_96 .. :try_end_99} :catch_9f

    .line 362
    :cond_99
    :goto_99
    if-eqz v1, :cond_9e

    .line 364
    :try_start_9b
    invoke-virtual {v1}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_9e
    .catch Ljava/io/IOException; {:try_start_9b .. :try_end_9e} :catch_a8

    .line 367
    :cond_9e
    :goto_9e
    throw v6

    .line 358
    :catch_9f
    move-exception v0

    .line 359
    .restart local v0    # "e":Ljava/io/IOException;
    const-string v7, "OpenPgp API"

    const-string v8, "IOException when closing ParcelFileDescriptor!"

    invoke-static {v7, v8, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_99

    .line 365
    .end local v0    # "e":Ljava/io/IOException;
    :catch_a8
    move-exception v0

    .line 366
    .restart local v0    # "e":Ljava/io/IOException;
    const-string v7, "OpenPgp API"

    const-string v8, "IOException when closing ParcelFileDescriptor!"

    invoke-static {v7, v8, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_9e
.end method

.method public executeApiAsync(Landroid/content/Intent;Ljava/io/InputStream;Ljava/io/OutputStream;Lorg/openintents/openpgp/util/OpenPgpApi$IOpenPgpCallback;)V
    .registers 12
    .param p1, "data"    # Landroid/content/Intent;
    .param p2, "is"    # Ljava/io/InputStream;
    .param p3, "os"    # Ljava/io/OutputStream;
    .param p4, "callback"    # Lorg/openintents/openpgp/util/OpenPgpApi$IOpenPgpCallback;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 296
    new-instance v0, Lorg/openintents/openpgp/util/OpenPgpApi$OpenPgpAsyncTask;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v6}, Lorg/openintents/openpgp/util/OpenPgpApi$OpenPgpAsyncTask;-><init>(Lorg/openintents/openpgp/util/OpenPgpApi;Landroid/content/Intent;Ljava/io/InputStream;Ljava/io/OutputStream;Lorg/openintents/openpgp/util/OpenPgpApi$IOpenPgpCallback;Lorg/openintents/openpgp/util/OpenPgpApi$1;)V

    .line 300
    .local v0, "task":Lorg/openintents/openpgp/util/OpenPgpApi$OpenPgpAsyncTask;
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-lt v1, v2, :cond_19

    .line 301
    sget-object v1, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    check-cast v6, [Ljava/lang/Void;

    invoke-virtual {v0, v1, v6}, Lorg/openintents/openpgp/util/OpenPgpApi$OpenPgpAsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 305
    :goto_18
    return-void

    .line 303
    :cond_19
    check-cast v6, [Ljava/lang/Void;

    invoke-virtual {v0, v6}, Lorg/openintents/openpgp/util/OpenPgpApi$OpenPgpAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_18
.end method
