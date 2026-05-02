.class Lezvcard/util/VCardDateFormat$1$1;
.super Ljava/text/SimpleDateFormat;
.source "VCardDateFormat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lezvcard/util/VCardDateFormat$1;->getDateFormat(Ljava/util/TimeZone;)Ljava/text/DateFormat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lezvcard/util/VCardDateFormat$1;


# direct methods
.method constructor <init>(Lezvcard/util/VCardDateFormat$1;Ljava/lang/String;)V
    .registers 3
    .param p2, "x0"    # Ljava/lang/String;

    .prologue
    .line 78
    iput-object p1, p0, Lezvcard/util/VCardDateFormat$1$1;->this$0:Lezvcard/util/VCardDateFormat$1;

    invoke-direct {p0, p2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public format(Ljava/util/Date;Ljava/lang/StringBuffer;Ljava/text/FieldPosition;)Ljava/lang/StringBuffer;
    .registers 7
    .param p1, "date"    # Ljava/util/Date;
    .param p2, "toAppendTo"    # Ljava/lang/StringBuffer;
    .param p3, "fieldPosition"    # Ljava/text/FieldPosition;

    .prologue
    .line 91
    invoke-super {p0, p1, p2, p3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;Ljava/lang/StringBuffer;Ljava/text/FieldPosition;)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 94
    .local v0, "sb":Ljava/lang/StringBuffer;
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x2

    const/16 v2, 0x3a

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuffer;->insert(IC)Ljava/lang/StringBuffer;

    .line 96
    return-object v0
.end method

.method public parse(Ljava/lang/String;)Ljava/util/Date;
    .registers 5
    .param p1, "str"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 83
    const/16 v1, 0x3a

    invoke-virtual {p1, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 84
    .local v0, "index":I
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 86
    invoke-super {p0, p1}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    return-object v1
.end method
