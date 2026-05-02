.class public Lfreemarker/template/utility/NormalizeNewlines;
.super Ljava/lang/Object;
.source "NormalizeNewlines.java"

# interfaces
.implements Lfreemarker/template/TemplateTransformModel;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getWriter(Ljava/io/Writer;Ljava/util/Map;)Ljava/io/Writer;
    .registers 5
    .param p1, "out"    # Ljava/io/Writer;
    .param p2, "args"    # Ljava/util/Map;

    .prologue
    .line 102
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 103
    .local v0, "buf":Ljava/lang/StringBuffer;
    new-instance v1, Lfreemarker/template/utility/NormalizeNewlines$1;

    invoke-direct {v1, p0, v0, p1}, Lfreemarker/template/utility/NormalizeNewlines$1;-><init>(Lfreemarker/template/utility/NormalizeNewlines;Ljava/lang/StringBuffer;Ljava/io/Writer;)V

    return-object v1
.end method

.method public transform(Ljava/io/Reader;Ljava/io/Writer;)V
    .registers 7
    .param p1, "in"    # Ljava/io/Reader;
    .param p2, "out"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 129
    instance-of v3, p1, Ljava/io/BufferedReader;

    if-eqz v3, :cond_27

    check-cast p1, Ljava/io/BufferedReader;

    .end local p1    # "in":Ljava/io/Reader;
    move-object v0, p1

    .line 132
    .local v0, "br":Ljava/io/BufferedReader;
    :goto_7
    instance-of v3, p2, Ljava/io/PrintWriter;

    if-eqz v3, :cond_2d

    check-cast p2, Ljava/io/PrintWriter;

    .end local p2    # "out":Ljava/io/Writer;
    move-object v2, p2

    .line 135
    .local v2, "pw":Ljava/io/PrintWriter;
    :goto_e
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    .line 136
    .local v1, "line":Ljava/lang/String;
    if-eqz v1, :cond_1d

    .line 137
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_1d

    .line 138
    invoke-virtual {v2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 141
    :cond_1d
    :goto_1d
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_33

    .line 142
    invoke-virtual {v2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_1d

    .line 129
    .end local v0    # "br":Ljava/io/BufferedReader;
    .end local v1    # "line":Ljava/lang/String;
    .end local v2    # "pw":Ljava/io/PrintWriter;
    .restart local p1    # "in":Ljava/io/Reader;
    .restart local p2    # "out":Ljava/io/Writer;
    :cond_27
    new-instance v0, Ljava/io/BufferedReader;

    invoke-direct {v0, p1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    goto :goto_7

    .line 132
    .end local p1    # "in":Ljava/io/Reader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    :cond_2d
    new-instance v2, Ljava/io/PrintWriter;

    invoke-direct {v2, p2}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    goto :goto_e

    .line 144
    .end local p2    # "out":Ljava/io/Writer;
    .restart local v1    # "line":Ljava/lang/String;
    .restart local v2    # "pw":Ljava/io/PrintWriter;
    :cond_33
    return-void
.end method
