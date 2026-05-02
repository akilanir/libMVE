.class Lfreemarker/ext/xml/Navigator$AncestorOp;
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
    name = "AncestorOp"
.end annotation


# instance fields
.field private final this$0:Lfreemarker/ext/xml/Navigator;


# direct methods
.method private constructor <init>(Lfreemarker/ext/xml/Navigator;)V
    .registers 2

    .prologue
    .line 237
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/ext/xml/Navigator$AncestorOp;->this$0:Lfreemarker/ext/xml/Navigator;

    return-void
.end method

.method constructor <init>(Lfreemarker/ext/xml/Navigator;Lfreemarker/ext/xml/Navigator$1;)V
    .registers 3
    .param p1, "x0"    # Lfreemarker/ext/xml/Navigator;
    .param p2, "x1"    # Lfreemarker/ext/xml/Navigator$1;

    .prologue
    .line 237
    invoke-direct {p0, p1}, Lfreemarker/ext/xml/Navigator$AncestorOp;-><init>(Lfreemarker/ext/xml/Navigator;)V

    return-void
.end method


# virtual methods
.method public process(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    .registers 6
    .param p1, "node"    # Ljava/lang/Object;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "namespaceUri"    # Ljava/lang/String;
    .param p4, "result"    # Ljava/util/List;

    .prologue
    .line 240
    iget-object v0, p0, Lfreemarker/ext/xml/Navigator$AncestorOp;->this$0:Lfreemarker/ext/xml/Navigator;

    invoke-static {v0, p1, p4}, Lfreemarker/ext/xml/Navigator;->access$1600(Lfreemarker/ext/xml/Navigator;Ljava/lang/Object;Ljava/util/List;)V

    .line 241
    return-void
.end method
