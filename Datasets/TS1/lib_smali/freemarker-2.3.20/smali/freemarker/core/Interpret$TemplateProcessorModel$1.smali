.class Lfreemarker/core/Interpret$TemplateProcessorModel$1;
.super Ljava/io/Writer;
.source "Interpret.java"


# instance fields
.field private final this$1:Lfreemarker/core/Interpret$TemplateProcessorModel;

.field private final val$out:Ljava/io/Writer;


# direct methods
.method constructor <init>(Lfreemarker/core/Interpret$TemplateProcessorModel;Ljava/lang/Object;Ljava/io/Writer;)V
    .registers 4
    .param p2, "x0"    # Ljava/lang/Object;

    .prologue
    .line 176
    invoke-direct {p0, p2}, Ljava/io/Writer;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lfreemarker/core/Interpret$TemplateProcessorModel$1;->this$1:Lfreemarker/core/Interpret$TemplateProcessorModel;

    iput-object p3, p0, Lfreemarker/core/Interpret$TemplateProcessorModel$1;->val$out:Ljava/io/Writer;

    return-void
.end method


# virtual methods
.method public close()V
    .registers 1

    .prologue
    .line 179
    return-void
.end method

.method public flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 183
    iget-object v0, p0, Lfreemarker/core/Interpret$TemplateProcessorModel$1;->val$out:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->flush()V

    .line 184
    return-void
.end method

.method public write([CII)V
    .registers 5
    .param p1, "cbuf"    # [C
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 188
    iget-object v0, p0, Lfreemarker/core/Interpret$TemplateProcessorModel$1;->val$out:Ljava/io/Writer;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/Writer;->write([CII)V

    .line 189
    return-void
.end method
