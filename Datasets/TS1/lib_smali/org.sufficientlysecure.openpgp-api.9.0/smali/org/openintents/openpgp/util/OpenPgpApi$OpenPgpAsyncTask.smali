.class Lorg/openintents/openpgp/util/OpenPgpApi$OpenPgpAsyncTask;
.super Landroid/os/AsyncTask;
.source "OpenPgpApi.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/openintents/openpgp/util/OpenPgpApi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "OpenPgpAsyncTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Integer;",
        "Landroid/content/Intent;",
        ">;"
    }
.end annotation


# instance fields
.field callback:Lorg/openintents/openpgp/util/OpenPgpApi$IOpenPgpCallback;

.field data:Landroid/content/Intent;

.field is:Ljava/io/InputStream;

.field os:Ljava/io/OutputStream;

.field final synthetic this$0:Lorg/openintents/openpgp/util/OpenPgpApi;


# direct methods
.method private constructor <init>(Lorg/openintents/openpgp/util/OpenPgpApi;Landroid/content/Intent;Ljava/io/InputStream;Ljava/io/OutputStream;Lorg/openintents/openpgp/util/OpenPgpApi$IOpenPgpCallback;)V
    .registers 6
    .param p2, "data"    # Landroid/content/Intent;
    .param p3, "is"    # Ljava/io/InputStream;
    .param p4, "os"    # Ljava/io/OutputStream;
    .param p5, "callback"    # Lorg/openintents/openpgp/util/OpenPgpApi$IOpenPgpCallback;

    .prologue
    .line 276
    iput-object p1, p0, Lorg/openintents/openpgp/util/OpenPgpApi$OpenPgpAsyncTask;->this$0:Lorg/openintents/openpgp/util/OpenPgpApi;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 277
    iput-object p2, p0, Lorg/openintents/openpgp/util/OpenPgpApi$OpenPgpAsyncTask;->data:Landroid/content/Intent;

    .line 278
    iput-object p3, p0, Lorg/openintents/openpgp/util/OpenPgpApi$OpenPgpAsyncTask;->is:Ljava/io/InputStream;

    .line 279
    iput-object p4, p0, Lorg/openintents/openpgp/util/OpenPgpApi$OpenPgpAsyncTask;->os:Ljava/io/OutputStream;

    .line 280
    iput-object p5, p0, Lorg/openintents/openpgp/util/OpenPgpApi$OpenPgpAsyncTask;->callback:Lorg/openintents/openpgp/util/OpenPgpApi$IOpenPgpCallback;

    .line 281
    return-void
.end method

.method synthetic constructor <init>(Lorg/openintents/openpgp/util/OpenPgpApi;Landroid/content/Intent;Ljava/io/InputStream;Ljava/io/OutputStream;Lorg/openintents/openpgp/util/OpenPgpApi$IOpenPgpCallback;Lorg/openintents/openpgp/util/OpenPgpApi$1;)V
    .registers 7
    .param p1, "x0"    # Lorg/openintents/openpgp/util/OpenPgpApi;
    .param p2, "x1"    # Landroid/content/Intent;
    .param p3, "x2"    # Ljava/io/InputStream;
    .param p4, "x3"    # Ljava/io/OutputStream;
    .param p5, "x4"    # Lorg/openintents/openpgp/util/OpenPgpApi$IOpenPgpCallback;
    .param p6, "x5"    # Lorg/openintents/openpgp/util/OpenPgpApi$1;

    .prologue
    .line 270
    invoke-direct/range {p0 .. p5}, Lorg/openintents/openpgp/util/OpenPgpApi$OpenPgpAsyncTask;-><init>(Lorg/openintents/openpgp/util/OpenPgpApi;Landroid/content/Intent;Ljava/io/InputStream;Ljava/io/OutputStream;Lorg/openintents/openpgp/util/OpenPgpApi$IOpenPgpCallback;)V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Landroid/content/Intent;
    .registers 6
    .param p1, "unused"    # [Ljava/lang/Void;

    .prologue
    .line 285
    iget-object v0, p0, Lorg/openintents/openpgp/util/OpenPgpApi$OpenPgpAsyncTask;->this$0:Lorg/openintents/openpgp/util/OpenPgpApi;

    iget-object v1, p0, Lorg/openintents/openpgp/util/OpenPgpApi$OpenPgpAsyncTask;->data:Landroid/content/Intent;

    iget-object v2, p0, Lorg/openintents/openpgp/util/OpenPgpApi$OpenPgpAsyncTask;->is:Ljava/io/InputStream;

    iget-object v3, p0, Lorg/openintents/openpgp/util/OpenPgpApi$OpenPgpAsyncTask;->os:Ljava/io/OutputStream;

    invoke-virtual {v0, v1, v2, v3}, Lorg/openintents/openpgp/util/OpenPgpApi;->executeApi(Landroid/content/Intent;Ljava/io/InputStream;Ljava/io/OutputStream;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 270
    check-cast p1, [Ljava/lang/Void;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/openintents/openpgp/util/OpenPgpApi$OpenPgpAsyncTask;->doInBackground([Ljava/lang/Void;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Landroid/content/Intent;)V
    .registers 3
    .param p1, "result"    # Landroid/content/Intent;

    .prologue
    .line 289
    iget-object v0, p0, Lorg/openintents/openpgp/util/OpenPgpApi$OpenPgpAsyncTask;->callback:Lorg/openintents/openpgp/util/OpenPgpApi$IOpenPgpCallback;

    invoke-interface {v0, p1}, Lorg/openintents/openpgp/util/OpenPgpApi$IOpenPgpCallback;->onReturn(Landroid/content/Intent;)V

    .line 290
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 270
    check-cast p1, Landroid/content/Intent;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/openintents/openpgp/util/OpenPgpApi$OpenPgpAsyncTask;->onPostExecute(Landroid/content/Intent;)V

    return-void
.end method
