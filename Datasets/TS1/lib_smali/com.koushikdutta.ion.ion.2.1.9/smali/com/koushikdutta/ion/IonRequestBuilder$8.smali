.class Lcom/koushikdutta/ion/IonRequestBuilder$8;
.super Ljava/lang/Object;
.source "IonRequestBuilder.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/ion/IonRequestBuilder;->write(Ljava/io/File;)Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

.field final synthetic val$file:Ljava/io/File;


# direct methods
.method constructor <init>(Lcom/koushikdutta/ion/IonRequestBuilder;Ljava/io/File;)V
    .registers 3
    .param p1, "this$0"    # Lcom/koushikdutta/ion/IonRequestBuilder;

    .prologue
    .line 760
    iput-object p1, p0, Lcom/koushikdutta/ion/IonRequestBuilder$8;->this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

    iput-object p2, p0, Lcom/koushikdutta/ion/IonRequestBuilder$8;->val$file:Ljava/io/File;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 763
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder$8;->val$file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 764
    return-void
.end method
