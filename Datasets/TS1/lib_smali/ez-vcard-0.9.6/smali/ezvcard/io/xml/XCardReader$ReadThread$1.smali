.class Lezvcard/io/xml/XCardReader$ReadThread$1;
.super Ljava/lang/Object;
.source "XCardReader.java"

# interfaces
.implements Ljavax/xml/transform/ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lezvcard/io/xml/XCardReader$ReadThread;-><init>(Lezvcard/io/xml/XCardReader;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lezvcard/io/xml/XCardReader$ReadThread;

.field final synthetic val$this$0:Lezvcard/io/xml/XCardReader;


# direct methods
.method constructor <init>(Lezvcard/io/xml/XCardReader$ReadThread;Lezvcard/io/xml/XCardReader;)V
    .registers 3

    .prologue
    .line 212
    iput-object p1, p0, Lezvcard/io/xml/XCardReader$ReadThread$1;->this$1:Lezvcard/io/xml/XCardReader$ReadThread;

    iput-object p2, p0, Lezvcard/io/xml/XCardReader$ReadThread$1;->val$this$0:Lezvcard/io/xml/XCardReader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public error(Ljavax/xml/transform/TransformerException;)V
    .registers 2
    .param p1, "e"    # Ljavax/xml/transform/TransformerException;

    .prologue
    .line 215
    return-void
.end method

.method public fatalError(Ljavax/xml/transform/TransformerException;)V
    .registers 2
    .param p1, "e"    # Ljavax/xml/transform/TransformerException;

    .prologue
    .line 219
    return-void
.end method

.method public warning(Ljavax/xml/transform/TransformerException;)V
    .registers 2
    .param p1, "e"    # Ljavax/xml/transform/TransformerException;

    .prologue
    .line 223
    return-void
.end method
