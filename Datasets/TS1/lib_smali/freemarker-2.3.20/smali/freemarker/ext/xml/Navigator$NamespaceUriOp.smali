.class Lfreemarker/ext/xml/Navigator$NamespaceUriOp;
.super Ljava/lang/Object;
.source "Navigator.java"

# interfaces
.implements Lfreemarker/ext/xml/NodeOperator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/ext/xml/Navigator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "NamespaceUriOp"
.end annotation


# instance fields
.field private final this$0:Lfreemarker/ext/xml/Navigator;


# direct methods
.method private constructor <init>(Lfreemarker/ext/xml/Navigator;)V
    .registers 2

    .prologue
    .line 321
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/ext/xml/Navigator$NamespaceUriOp;->this$0:Lfreemarker/ext/xml/Navigator;

    return-void
.end method

.method constructor <init>(Lfreemarker/ext/xml/Navigator;Lfreemarker/ext/xml/Navigator$1;)V
    .registers 3
    .param p1, "x0"    # Lfreemarker/ext/xml/Navigator;
    .param p2, "x1"    # Lfreemarker/ext/xml/Navigator$1;

    .prologue
    .line 321
    invoke-direct {p0, p1}, Lfreemarker/ext/xml/Navigator$NamespaceUriOp;-><init>(Lfreemarker/ext/xml/Navigator;)V

    return-void
.end method


# virtual methods
.method public process(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    .registers 7
    .param p1, "node"    # Ljava/lang/Object;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "namespaceUri"    # Ljava/lang/String;
    .param p4, "result"    # Ljava/util/List;

    .prologue
    .line 324
    iget-object v1, p0, Lfreemarker/ext/xml/Navigator$NamespaceUriOp;->this$0:Lfreemarker/ext/xml/Navigator;

    invoke-virtual {v1, p1}, Lfreemarker/ext/xml/Navigator;->getNamespaceUri(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 325
    .local v0, "text":Ljava/lang/String;
    if-eqz v0, :cond_b

    .line 326
    invoke-interface {p4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 328
    :cond_b
    return-void
.end method
