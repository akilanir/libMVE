.class public final Lfreemarker/template/utility/NullWriter;
.super Ljava/io/Writer;
.source "NullWriter.java"


# static fields
.field public static final INSTANCE:Lfreemarker/template/utility/NullWriter;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 13
    new-instance v0, Lfreemarker/template/utility/NullWriter;

    invoke-direct {v0}, Lfreemarker/template/utility/NullWriter;-><init>()V

    sput-object v0, Lfreemarker/template/utility/NullWriter;->INSTANCE:Lfreemarker/template/utility/NullWriter;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/io/Writer;-><init>()V

    return-void
.end method


# virtual methods
.method public close()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 28
    return-void
.end method

.method public flush()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 24
    return-void
.end method

.method public write(I)V
    .registers 2
    .param p1, "c"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 32
    return-void
.end method

.method public write(Ljava/lang/String;)V
    .registers 2
    .param p1, "str"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 40
    return-void
.end method

.method public write(Ljava/lang/String;II)V
    .registers 4
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 44
    return-void
.end method

.method public write([C)V
    .registers 2
    .param p1, "cbuf"    # [C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 36
    return-void
.end method

.method public write([CII)V
    .registers 4
    .param p1, "cbuf"    # [C
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 20
    return-void
.end method
