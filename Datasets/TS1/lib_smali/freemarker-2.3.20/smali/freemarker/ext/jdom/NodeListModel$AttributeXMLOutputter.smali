.class final Lfreemarker/ext/jdom/NodeListModel$AttributeXMLOutputter;
.super Lorg/jdom/output/XMLOutputter;
.source "NodeListModel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/ext/jdom/NodeListModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "AttributeXMLOutputter"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 1260
    invoke-direct {p0}, Lorg/jdom/output/XMLOutputter;-><init>()V

    return-void
.end method

.method constructor <init>(Lfreemarker/ext/jdom/NodeListModel$1;)V
    .registers 2
    .param p1, "x0"    # Lfreemarker/ext/jdom/NodeListModel$1;

    .prologue
    .line 1260
    invoke-direct {p0}, Lfreemarker/ext/jdom/NodeListModel$AttributeXMLOutputter;-><init>()V

    return-void
.end method


# virtual methods
.method public output(Lorg/jdom/Attribute;Ljava/io/Writer;)V
    .registers 4
    .param p1, "attribute"    # Lorg/jdom/Attribute;
    .param p2, "out"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1265
    const-string v0, " "

    invoke-virtual {p2, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1266
    invoke-virtual {p1}, Lorg/jdom/Attribute;->getQualifiedName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1267
    const-string v0, "="

    invoke-virtual {p2, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1269
    const-string v0, "\""

    invoke-virtual {p2, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1270
    invoke-virtual {p1}, Lorg/jdom/Attribute;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lfreemarker/ext/jdom/NodeListModel$AttributeXMLOutputter;->escapeAttributeEntities(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1271
    const-string v0, "\""

    invoke-virtual {p2, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1272
    return-void
.end method
