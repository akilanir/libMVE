.class Lorg/spongycastle/jce/provider/BouncyCastleProvider$1;
.super Ljava/lang/Object;
.source "BouncyCastleProvider.java"

# interfaces
.implements Ljava/security/PrivilegedAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/spongycastle/jce/provider/BouncyCastleProvider;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/spongycastle/jce/provider/BouncyCastleProvider;


# direct methods
.method constructor <init>(Lorg/spongycastle/jce/provider/BouncyCastleProvider;)V
    .registers 2
    .param p1, "this$0"    # Lorg/spongycastle/jce/provider/BouncyCastleProvider;

    .prologue
    .line 124
    iput-object p1, p0, Lorg/spongycastle/jce/provider/BouncyCastleProvider$1;->this$0:Lorg/spongycastle/jce/provider/BouncyCastleProvider;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 127
    iget-object v0, p0, Lorg/spongycastle/jce/provider/BouncyCastleProvider$1;->this$0:Lorg/spongycastle/jce/provider/BouncyCastleProvider;

    # invokes: Lorg/spongycastle/jce/provider/BouncyCastleProvider;->setup()V
    invoke-static {v0}, Lorg/spongycastle/jce/provider/BouncyCastleProvider;->access$000(Lorg/spongycastle/jce/provider/BouncyCastleProvider;)V

    .line 128
    const/4 v0, 0x0

    return-object v0
.end method
