.class public Lorg/apache/commons/digester/xmlrules/CircularIncludeException;
.super Lorg/apache/commons/digester/xmlrules/XmlLoadException;
.source "CircularIncludeException.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "fileName"    # Ljava/lang/String;

    .prologue
    .line 37
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "Circular file inclusion detected for file: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/commons/digester/xmlrules/XmlLoadException;-><init>(Ljava/lang/String;)V

    .line 38
    return-void
.end method
