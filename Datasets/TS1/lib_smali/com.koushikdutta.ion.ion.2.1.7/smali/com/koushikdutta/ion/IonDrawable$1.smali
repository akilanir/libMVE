.class Lcom/koushikdutta/ion/IonDrawable$1;
.super Ljava/lang/Object;
.source "IonDrawable.java"

# interfaces
.implements Lcom/koushikdutta/async/future/FutureCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/koushikdutta/ion/IonDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/koushikdutta/async/future/FutureCallback",
        "<",
        "Lcom/koushikdutta/ion/bitmap/BitmapInfo;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/ion/IonDrawable;


# direct methods
.method constructor <init>(Lcom/koushikdutta/ion/IonDrawable;)V
    .registers 2

    .prologue
    .line 434
    iput-object p1, p0, Lcom/koushikdutta/ion/IonDrawable$1;->this$0:Lcom/koushikdutta/ion/IonDrawable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V
    .registers 4
    .param p1, "e"    # Ljava/lang/Exception;
    .param p2, "result"    # Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    .prologue
    .line 437
    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable$1;->this$0:Lcom/koushikdutta/ion/IonDrawable;

    invoke-virtual {v0}, Lcom/koushikdutta/ion/IonDrawable;->invalidateSelf()V

    .line 438
    return-void
.end method

.method public bridge synthetic onCompleted(Ljava/lang/Exception;Ljava/lang/Object;)V
    .registers 3
    .param p1, "x0"    # Ljava/lang/Exception;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 434
    check-cast p2, Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/koushikdutta/ion/IonDrawable$1;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V

    return-void
.end method
