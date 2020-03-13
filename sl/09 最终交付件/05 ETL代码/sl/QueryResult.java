// ORM class for table 'null'
// WARNING: This class is AUTO-GENERATED. Modify at your own risk.
//
// Debug information:
// Generated date: Mon Oct 29 20:52:59 CST 2018
// For connector: org.apache.sqoop.manager.SQLServerManager
import org.apache.hadoop.io.BytesWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.Writable;
import org.apache.hadoop.mapred.lib.db.DBWritable;
import com.cloudera.sqoop.lib.JdbcWritableBridge;
import com.cloudera.sqoop.lib.DelimiterSet;
import com.cloudera.sqoop.lib.FieldFormatter;
import com.cloudera.sqoop.lib.RecordParser;
import com.cloudera.sqoop.lib.BooleanParser;
import com.cloudera.sqoop.lib.BlobRef;
import com.cloudera.sqoop.lib.ClobRef;
import com.cloudera.sqoop.lib.LargeObjectLoader;
import com.cloudera.sqoop.lib.SqoopRecord;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

public class QueryResult extends SqoopRecord  implements DBWritable, Writable {
  private final int PROTOCOL_VERSION = 3;
  public int getClassFormatVersion() { return PROTOCOL_VERSION; }
  public static interface FieldSetterCommand {    void setField(Object value);  }  protected ResultSet __cur_result_set;
  private Map<String, FieldSetterCommand> setters = new HashMap<String, FieldSetterCommand>();
  private void init0() {
    setters.put("id", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        id = (Long)value;
      }
    });
    setters.put("delivery_detail_id", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        delivery_detail_id = (Long)value;
      }
    });
    setters.put("source_code", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        source_code = (String)value;
      }
    });
    setters.put("source_header_id", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        source_header_id = (Long)value;
      }
    });
    setters.put("source_line_id", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        source_line_id = (Long)value;
      }
    });
    setters.put("shipped_quantity", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        shipped_quantity = (Long)value;
      }
    });
    setters.put("requested_quantity_uom", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        requested_quantity_uom = (String)value;
      }
    });
    setters.put("ship_method_code", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        ship_method_code = (String)value;
      }
    });
    setters.put("shipping_instructions", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        shipping_instructions = (String)value;
      }
    });
    setters.put("packing_instructions", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        packing_instructions = (String)value;
      }
    });
    setters.put("freight_code", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        freight_code = (String)value;
      }
    });
    setters.put("last_update_date", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        last_update_date = (java.sql.Timestamp)value;
      }
    });
    setters.put("createdate", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        createdate = (java.sql.Timestamp)value;
      }
    });
    setters.put("disflag", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        disflag = (Integer)value;
      }
    });
    setters.put("jsid", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        jsid = (Integer)value;
      }
    });
    setters.put("dms", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        dms = (String)value;
      }
    });
    setters.put("erp", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        erp = (String)value;
      }
    });
    setters.put("o_erp_lineid", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        o_erp_lineid = (Long)value;
      }
    });
    setters.put("o_erp_deliverlineid", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        o_erp_deliverlineid = (Long)value;
      }
    });
    setters.put("o_erp_lineid_old", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        o_erp_lineid_old = (Long)value;
      }
    });
    setters.put("jstime", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        jstime = (java.sql.Timestamp)value;
      }
    });
    setters.put("received_status_code", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        received_status_code = (String)value;
      }
    });
    setters.put("received_status_time", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        received_status_time = (java.sql.Timestamp)value;
      }
    });
    setters.put("oldflag", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        oldflag = (String)value;
      }
    });
    setters.put("bg_name", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        bg_name = (String)value;
      }
    });
    setters.put("w_insert_dt", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        w_insert_dt = (java.sql.Timestamp)value;
      }
    });
    setters.put("w_update_dt", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        w_update_dt = (java.sql.Timestamp)value;
      }
    });
  }
  public QueryResult() {
    init0();
  }
  private Long id;
  public Long get_id() {
    return id;
  }
  public void set_id(Long id) {
    this.id = id;
  }
  public QueryResult with_id(Long id) {
    this.id = id;
    return this;
  }
  private Long delivery_detail_id;
  public Long get_delivery_detail_id() {
    return delivery_detail_id;
  }
  public void set_delivery_detail_id(Long delivery_detail_id) {
    this.delivery_detail_id = delivery_detail_id;
  }
  public QueryResult with_delivery_detail_id(Long delivery_detail_id) {
    this.delivery_detail_id = delivery_detail_id;
    return this;
  }
  private String source_code;
  public String get_source_code() {
    return source_code;
  }
  public void set_source_code(String source_code) {
    this.source_code = source_code;
  }
  public QueryResult with_source_code(String source_code) {
    this.source_code = source_code;
    return this;
  }
  private Long source_header_id;
  public Long get_source_header_id() {
    return source_header_id;
  }
  public void set_source_header_id(Long source_header_id) {
    this.source_header_id = source_header_id;
  }
  public QueryResult with_source_header_id(Long source_header_id) {
    this.source_header_id = source_header_id;
    return this;
  }
  private Long source_line_id;
  public Long get_source_line_id() {
    return source_line_id;
  }
  public void set_source_line_id(Long source_line_id) {
    this.source_line_id = source_line_id;
  }
  public QueryResult with_source_line_id(Long source_line_id) {
    this.source_line_id = source_line_id;
    return this;
  }
  private Long shipped_quantity;
  public Long get_shipped_quantity() {
    return shipped_quantity;
  }
  public void set_shipped_quantity(Long shipped_quantity) {
    this.shipped_quantity = shipped_quantity;
  }
  public QueryResult with_shipped_quantity(Long shipped_quantity) {
    this.shipped_quantity = shipped_quantity;
    return this;
  }
  private String requested_quantity_uom;
  public String get_requested_quantity_uom() {
    return requested_quantity_uom;
  }
  public void set_requested_quantity_uom(String requested_quantity_uom) {
    this.requested_quantity_uom = requested_quantity_uom;
  }
  public QueryResult with_requested_quantity_uom(String requested_quantity_uom) {
    this.requested_quantity_uom = requested_quantity_uom;
    return this;
  }
  private String ship_method_code;
  public String get_ship_method_code() {
    return ship_method_code;
  }
  public void set_ship_method_code(String ship_method_code) {
    this.ship_method_code = ship_method_code;
  }
  public QueryResult with_ship_method_code(String ship_method_code) {
    this.ship_method_code = ship_method_code;
    return this;
  }
  private String shipping_instructions;
  public String get_shipping_instructions() {
    return shipping_instructions;
  }
  public void set_shipping_instructions(String shipping_instructions) {
    this.shipping_instructions = shipping_instructions;
  }
  public QueryResult with_shipping_instructions(String shipping_instructions) {
    this.shipping_instructions = shipping_instructions;
    return this;
  }
  private String packing_instructions;
  public String get_packing_instructions() {
    return packing_instructions;
  }
  public void set_packing_instructions(String packing_instructions) {
    this.packing_instructions = packing_instructions;
  }
  public QueryResult with_packing_instructions(String packing_instructions) {
    this.packing_instructions = packing_instructions;
    return this;
  }
  private String freight_code;
  public String get_freight_code() {
    return freight_code;
  }
  public void set_freight_code(String freight_code) {
    this.freight_code = freight_code;
  }
  public QueryResult with_freight_code(String freight_code) {
    this.freight_code = freight_code;
    return this;
  }
  private java.sql.Timestamp last_update_date;
  public java.sql.Timestamp get_last_update_date() {
    return last_update_date;
  }
  public void set_last_update_date(java.sql.Timestamp last_update_date) {
    this.last_update_date = last_update_date;
  }
  public QueryResult with_last_update_date(java.sql.Timestamp last_update_date) {
    this.last_update_date = last_update_date;
    return this;
  }
  private java.sql.Timestamp createdate;
  public java.sql.Timestamp get_createdate() {
    return createdate;
  }
  public void set_createdate(java.sql.Timestamp createdate) {
    this.createdate = createdate;
  }
  public QueryResult with_createdate(java.sql.Timestamp createdate) {
    this.createdate = createdate;
    return this;
  }
  private Integer disflag;
  public Integer get_disflag() {
    return disflag;
  }
  public void set_disflag(Integer disflag) {
    this.disflag = disflag;
  }
  public QueryResult with_disflag(Integer disflag) {
    this.disflag = disflag;
    return this;
  }
  private Integer jsid;
  public Integer get_jsid() {
    return jsid;
  }
  public void set_jsid(Integer jsid) {
    this.jsid = jsid;
  }
  public QueryResult with_jsid(Integer jsid) {
    this.jsid = jsid;
    return this;
  }
  private String dms;
  public String get_dms() {
    return dms;
  }
  public void set_dms(String dms) {
    this.dms = dms;
  }
  public QueryResult with_dms(String dms) {
    this.dms = dms;
    return this;
  }
  private String erp;
  public String get_erp() {
    return erp;
  }
  public void set_erp(String erp) {
    this.erp = erp;
  }
  public QueryResult with_erp(String erp) {
    this.erp = erp;
    return this;
  }
  private Long o_erp_lineid;
  public Long get_o_erp_lineid() {
    return o_erp_lineid;
  }
  public void set_o_erp_lineid(Long o_erp_lineid) {
    this.o_erp_lineid = o_erp_lineid;
  }
  public QueryResult with_o_erp_lineid(Long o_erp_lineid) {
    this.o_erp_lineid = o_erp_lineid;
    return this;
  }
  private Long o_erp_deliverlineid;
  public Long get_o_erp_deliverlineid() {
    return o_erp_deliverlineid;
  }
  public void set_o_erp_deliverlineid(Long o_erp_deliverlineid) {
    this.o_erp_deliverlineid = o_erp_deliverlineid;
  }
  public QueryResult with_o_erp_deliverlineid(Long o_erp_deliverlineid) {
    this.o_erp_deliverlineid = o_erp_deliverlineid;
    return this;
  }
  private Long o_erp_lineid_old;
  public Long get_o_erp_lineid_old() {
    return o_erp_lineid_old;
  }
  public void set_o_erp_lineid_old(Long o_erp_lineid_old) {
    this.o_erp_lineid_old = o_erp_lineid_old;
  }
  public QueryResult with_o_erp_lineid_old(Long o_erp_lineid_old) {
    this.o_erp_lineid_old = o_erp_lineid_old;
    return this;
  }
  private java.sql.Timestamp jstime;
  public java.sql.Timestamp get_jstime() {
    return jstime;
  }
  public void set_jstime(java.sql.Timestamp jstime) {
    this.jstime = jstime;
  }
  public QueryResult with_jstime(java.sql.Timestamp jstime) {
    this.jstime = jstime;
    return this;
  }
  private String received_status_code;
  public String get_received_status_code() {
    return received_status_code;
  }
  public void set_received_status_code(String received_status_code) {
    this.received_status_code = received_status_code;
  }
  public QueryResult with_received_status_code(String received_status_code) {
    this.received_status_code = received_status_code;
    return this;
  }
  private java.sql.Timestamp received_status_time;
  public java.sql.Timestamp get_received_status_time() {
    return received_status_time;
  }
  public void set_received_status_time(java.sql.Timestamp received_status_time) {
    this.received_status_time = received_status_time;
  }
  public QueryResult with_received_status_time(java.sql.Timestamp received_status_time) {
    this.received_status_time = received_status_time;
    return this;
  }
  private String oldflag;
  public String get_oldflag() {
    return oldflag;
  }
  public void set_oldflag(String oldflag) {
    this.oldflag = oldflag;
  }
  public QueryResult with_oldflag(String oldflag) {
    this.oldflag = oldflag;
    return this;
  }
  private String bg_name;
  public String get_bg_name() {
    return bg_name;
  }
  public void set_bg_name(String bg_name) {
    this.bg_name = bg_name;
  }
  public QueryResult with_bg_name(String bg_name) {
    this.bg_name = bg_name;
    return this;
  }
  private java.sql.Timestamp w_insert_dt;
  public java.sql.Timestamp get_w_insert_dt() {
    return w_insert_dt;
  }
  public void set_w_insert_dt(java.sql.Timestamp w_insert_dt) {
    this.w_insert_dt = w_insert_dt;
  }
  public QueryResult with_w_insert_dt(java.sql.Timestamp w_insert_dt) {
    this.w_insert_dt = w_insert_dt;
    return this;
  }
  private java.sql.Timestamp w_update_dt;
  public java.sql.Timestamp get_w_update_dt() {
    return w_update_dt;
  }
  public void set_w_update_dt(java.sql.Timestamp w_update_dt) {
    this.w_update_dt = w_update_dt;
  }
  public QueryResult with_w_update_dt(java.sql.Timestamp w_update_dt) {
    this.w_update_dt = w_update_dt;
    return this;
  }
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof QueryResult)) {
      return false;
    }
    QueryResult that = (QueryResult) o;
    boolean equal = true;
    equal = equal && (this.id == null ? that.id == null : this.id.equals(that.id));
    equal = equal && (this.delivery_detail_id == null ? that.delivery_detail_id == null : this.delivery_detail_id.equals(that.delivery_detail_id));
    equal = equal && (this.source_code == null ? that.source_code == null : this.source_code.equals(that.source_code));
    equal = equal && (this.source_header_id == null ? that.source_header_id == null : this.source_header_id.equals(that.source_header_id));
    equal = equal && (this.source_line_id == null ? that.source_line_id == null : this.source_line_id.equals(that.source_line_id));
    equal = equal && (this.shipped_quantity == null ? that.shipped_quantity == null : this.shipped_quantity.equals(that.shipped_quantity));
    equal = equal && (this.requested_quantity_uom == null ? that.requested_quantity_uom == null : this.requested_quantity_uom.equals(that.requested_quantity_uom));
    equal = equal && (this.ship_method_code == null ? that.ship_method_code == null : this.ship_method_code.equals(that.ship_method_code));
    equal = equal && (this.shipping_instructions == null ? that.shipping_instructions == null : this.shipping_instructions.equals(that.shipping_instructions));
    equal = equal && (this.packing_instructions == null ? that.packing_instructions == null : this.packing_instructions.equals(that.packing_instructions));
    equal = equal && (this.freight_code == null ? that.freight_code == null : this.freight_code.equals(that.freight_code));
    equal = equal && (this.last_update_date == null ? that.last_update_date == null : this.last_update_date.equals(that.last_update_date));
    equal = equal && (this.createdate == null ? that.createdate == null : this.createdate.equals(that.createdate));
    equal = equal && (this.disflag == null ? that.disflag == null : this.disflag.equals(that.disflag));
    equal = equal && (this.jsid == null ? that.jsid == null : this.jsid.equals(that.jsid));
    equal = equal && (this.dms == null ? that.dms == null : this.dms.equals(that.dms));
    equal = equal && (this.erp == null ? that.erp == null : this.erp.equals(that.erp));
    equal = equal && (this.o_erp_lineid == null ? that.o_erp_lineid == null : this.o_erp_lineid.equals(that.o_erp_lineid));
    equal = equal && (this.o_erp_deliverlineid == null ? that.o_erp_deliverlineid == null : this.o_erp_deliverlineid.equals(that.o_erp_deliverlineid));
    equal = equal && (this.o_erp_lineid_old == null ? that.o_erp_lineid_old == null : this.o_erp_lineid_old.equals(that.o_erp_lineid_old));
    equal = equal && (this.jstime == null ? that.jstime == null : this.jstime.equals(that.jstime));
    equal = equal && (this.received_status_code == null ? that.received_status_code == null : this.received_status_code.equals(that.received_status_code));
    equal = equal && (this.received_status_time == null ? that.received_status_time == null : this.received_status_time.equals(that.received_status_time));
    equal = equal && (this.oldflag == null ? that.oldflag == null : this.oldflag.equals(that.oldflag));
    equal = equal && (this.bg_name == null ? that.bg_name == null : this.bg_name.equals(that.bg_name));
    equal = equal && (this.w_insert_dt == null ? that.w_insert_dt == null : this.w_insert_dt.equals(that.w_insert_dt));
    equal = equal && (this.w_update_dt == null ? that.w_update_dt == null : this.w_update_dt.equals(that.w_update_dt));
    return equal;
  }
  public boolean equals0(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof QueryResult)) {
      return false;
    }
    QueryResult that = (QueryResult) o;
    boolean equal = true;
    equal = equal && (this.id == null ? that.id == null : this.id.equals(that.id));
    equal = equal && (this.delivery_detail_id == null ? that.delivery_detail_id == null : this.delivery_detail_id.equals(that.delivery_detail_id));
    equal = equal && (this.source_code == null ? that.source_code == null : this.source_code.equals(that.source_code));
    equal = equal && (this.source_header_id == null ? that.source_header_id == null : this.source_header_id.equals(that.source_header_id));
    equal = equal && (this.source_line_id == null ? that.source_line_id == null : this.source_line_id.equals(that.source_line_id));
    equal = equal && (this.shipped_quantity == null ? that.shipped_quantity == null : this.shipped_quantity.equals(that.shipped_quantity));
    equal = equal && (this.requested_quantity_uom == null ? that.requested_quantity_uom == null : this.requested_quantity_uom.equals(that.requested_quantity_uom));
    equal = equal && (this.ship_method_code == null ? that.ship_method_code == null : this.ship_method_code.equals(that.ship_method_code));
    equal = equal && (this.shipping_instructions == null ? that.shipping_instructions == null : this.shipping_instructions.equals(that.shipping_instructions));
    equal = equal && (this.packing_instructions == null ? that.packing_instructions == null : this.packing_instructions.equals(that.packing_instructions));
    equal = equal && (this.freight_code == null ? that.freight_code == null : this.freight_code.equals(that.freight_code));
    equal = equal && (this.last_update_date == null ? that.last_update_date == null : this.last_update_date.equals(that.last_update_date));
    equal = equal && (this.createdate == null ? that.createdate == null : this.createdate.equals(that.createdate));
    equal = equal && (this.disflag == null ? that.disflag == null : this.disflag.equals(that.disflag));
    equal = equal && (this.jsid == null ? that.jsid == null : this.jsid.equals(that.jsid));
    equal = equal && (this.dms == null ? that.dms == null : this.dms.equals(that.dms));
    equal = equal && (this.erp == null ? that.erp == null : this.erp.equals(that.erp));
    equal = equal && (this.o_erp_lineid == null ? that.o_erp_lineid == null : this.o_erp_lineid.equals(that.o_erp_lineid));
    equal = equal && (this.o_erp_deliverlineid == null ? that.o_erp_deliverlineid == null : this.o_erp_deliverlineid.equals(that.o_erp_deliverlineid));
    equal = equal && (this.o_erp_lineid_old == null ? that.o_erp_lineid_old == null : this.o_erp_lineid_old.equals(that.o_erp_lineid_old));
    equal = equal && (this.jstime == null ? that.jstime == null : this.jstime.equals(that.jstime));
    equal = equal && (this.received_status_code == null ? that.received_status_code == null : this.received_status_code.equals(that.received_status_code));
    equal = equal && (this.received_status_time == null ? that.received_status_time == null : this.received_status_time.equals(that.received_status_time));
    equal = equal && (this.oldflag == null ? that.oldflag == null : this.oldflag.equals(that.oldflag));
    equal = equal && (this.bg_name == null ? that.bg_name == null : this.bg_name.equals(that.bg_name));
    equal = equal && (this.w_insert_dt == null ? that.w_insert_dt == null : this.w_insert_dt.equals(that.w_insert_dt));
    equal = equal && (this.w_update_dt == null ? that.w_update_dt == null : this.w_update_dt.equals(that.w_update_dt));
    return equal;
  }
  public void readFields(ResultSet __dbResults) throws SQLException {
    this.__cur_result_set = __dbResults;
    this.id = JdbcWritableBridge.readLong(1, __dbResults);
    this.delivery_detail_id = JdbcWritableBridge.readLong(2, __dbResults);
    this.source_code = JdbcWritableBridge.readString(3, __dbResults);
    this.source_header_id = JdbcWritableBridge.readLong(4, __dbResults);
    this.source_line_id = JdbcWritableBridge.readLong(5, __dbResults);
    this.shipped_quantity = JdbcWritableBridge.readLong(6, __dbResults);
    this.requested_quantity_uom = JdbcWritableBridge.readString(7, __dbResults);
    this.ship_method_code = JdbcWritableBridge.readString(8, __dbResults);
    this.shipping_instructions = JdbcWritableBridge.readString(9, __dbResults);
    this.packing_instructions = JdbcWritableBridge.readString(10, __dbResults);
    this.freight_code = JdbcWritableBridge.readString(11, __dbResults);
    this.last_update_date = JdbcWritableBridge.readTimestamp(12, __dbResults);
    this.createdate = JdbcWritableBridge.readTimestamp(13, __dbResults);
    this.disflag = JdbcWritableBridge.readInteger(14, __dbResults);
    this.jsid = JdbcWritableBridge.readInteger(15, __dbResults);
    this.dms = JdbcWritableBridge.readString(16, __dbResults);
    this.erp = JdbcWritableBridge.readString(17, __dbResults);
    this.o_erp_lineid = JdbcWritableBridge.readLong(18, __dbResults);
    this.o_erp_deliverlineid = JdbcWritableBridge.readLong(19, __dbResults);
    this.o_erp_lineid_old = JdbcWritableBridge.readLong(20, __dbResults);
    this.jstime = JdbcWritableBridge.readTimestamp(21, __dbResults);
    this.received_status_code = JdbcWritableBridge.readString(22, __dbResults);
    this.received_status_time = JdbcWritableBridge.readTimestamp(23, __dbResults);
    this.oldflag = JdbcWritableBridge.readString(24, __dbResults);
    this.bg_name = JdbcWritableBridge.readString(25, __dbResults);
    this.w_insert_dt = JdbcWritableBridge.readTimestamp(26, __dbResults);
    this.w_update_dt = JdbcWritableBridge.readTimestamp(27, __dbResults);
  }
  public void readFields0(ResultSet __dbResults) throws SQLException {
    this.id = JdbcWritableBridge.readLong(1, __dbResults);
    this.delivery_detail_id = JdbcWritableBridge.readLong(2, __dbResults);
    this.source_code = JdbcWritableBridge.readString(3, __dbResults);
    this.source_header_id = JdbcWritableBridge.readLong(4, __dbResults);
    this.source_line_id = JdbcWritableBridge.readLong(5, __dbResults);
    this.shipped_quantity = JdbcWritableBridge.readLong(6, __dbResults);
    this.requested_quantity_uom = JdbcWritableBridge.readString(7, __dbResults);
    this.ship_method_code = JdbcWritableBridge.readString(8, __dbResults);
    this.shipping_instructions = JdbcWritableBridge.readString(9, __dbResults);
    this.packing_instructions = JdbcWritableBridge.readString(10, __dbResults);
    this.freight_code = JdbcWritableBridge.readString(11, __dbResults);
    this.last_update_date = JdbcWritableBridge.readTimestamp(12, __dbResults);
    this.createdate = JdbcWritableBridge.readTimestamp(13, __dbResults);
    this.disflag = JdbcWritableBridge.readInteger(14, __dbResults);
    this.jsid = JdbcWritableBridge.readInteger(15, __dbResults);
    this.dms = JdbcWritableBridge.readString(16, __dbResults);
    this.erp = JdbcWritableBridge.readString(17, __dbResults);
    this.o_erp_lineid = JdbcWritableBridge.readLong(18, __dbResults);
    this.o_erp_deliverlineid = JdbcWritableBridge.readLong(19, __dbResults);
    this.o_erp_lineid_old = JdbcWritableBridge.readLong(20, __dbResults);
    this.jstime = JdbcWritableBridge.readTimestamp(21, __dbResults);
    this.received_status_code = JdbcWritableBridge.readString(22, __dbResults);
    this.received_status_time = JdbcWritableBridge.readTimestamp(23, __dbResults);
    this.oldflag = JdbcWritableBridge.readString(24, __dbResults);
    this.bg_name = JdbcWritableBridge.readString(25, __dbResults);
    this.w_insert_dt = JdbcWritableBridge.readTimestamp(26, __dbResults);
    this.w_update_dt = JdbcWritableBridge.readTimestamp(27, __dbResults);
  }
  public void loadLargeObjects(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void loadLargeObjects0(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void write(PreparedStatement __dbStmt) throws SQLException {
    write(__dbStmt, 0);
  }

  public int write(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeLong(id, 1 + __off, -5, __dbStmt);
    JdbcWritableBridge.writeLong(delivery_detail_id, 2 + __off, -5, __dbStmt);
    JdbcWritableBridge.writeString(source_code, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeLong(source_header_id, 4 + __off, -5, __dbStmt);
    JdbcWritableBridge.writeLong(source_line_id, 5 + __off, -5, __dbStmt);
    JdbcWritableBridge.writeLong(shipped_quantity, 6 + __off, -5, __dbStmt);
    JdbcWritableBridge.writeString(requested_quantity_uom, 7 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(ship_method_code, 8 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(shipping_instructions, 9 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(packing_instructions, 10 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(freight_code, 11 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeTimestamp(last_update_date, 12 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(createdate, 13 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeInteger(disflag, 14 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(jsid, 15 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeString(dms, 16 + __off, -9, __dbStmt);
    JdbcWritableBridge.writeString(erp, 17 + __off, -9, __dbStmt);
    JdbcWritableBridge.writeLong(o_erp_lineid, 18 + __off, -5, __dbStmt);
    JdbcWritableBridge.writeLong(o_erp_deliverlineid, 19 + __off, -5, __dbStmt);
    JdbcWritableBridge.writeLong(o_erp_lineid_old, 20 + __off, -5, __dbStmt);
    JdbcWritableBridge.writeTimestamp(jstime, 21 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeString(received_status_code, 22 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeTimestamp(received_status_time, 23 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeString(oldflag, 24 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(bg_name, 25 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeTimestamp(w_insert_dt, 26 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(w_update_dt, 27 + __off, 93, __dbStmt);
    return 27;
  }
  public void write0(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeLong(id, 1 + __off, -5, __dbStmt);
    JdbcWritableBridge.writeLong(delivery_detail_id, 2 + __off, -5, __dbStmt);
    JdbcWritableBridge.writeString(source_code, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeLong(source_header_id, 4 + __off, -5, __dbStmt);
    JdbcWritableBridge.writeLong(source_line_id, 5 + __off, -5, __dbStmt);
    JdbcWritableBridge.writeLong(shipped_quantity, 6 + __off, -5, __dbStmt);
    JdbcWritableBridge.writeString(requested_quantity_uom, 7 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(ship_method_code, 8 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(shipping_instructions, 9 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(packing_instructions, 10 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(freight_code, 11 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeTimestamp(last_update_date, 12 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(createdate, 13 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeInteger(disflag, 14 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(jsid, 15 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeString(dms, 16 + __off, -9, __dbStmt);
    JdbcWritableBridge.writeString(erp, 17 + __off, -9, __dbStmt);
    JdbcWritableBridge.writeLong(o_erp_lineid, 18 + __off, -5, __dbStmt);
    JdbcWritableBridge.writeLong(o_erp_deliverlineid, 19 + __off, -5, __dbStmt);
    JdbcWritableBridge.writeLong(o_erp_lineid_old, 20 + __off, -5, __dbStmt);
    JdbcWritableBridge.writeTimestamp(jstime, 21 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeString(received_status_code, 22 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeTimestamp(received_status_time, 23 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeString(oldflag, 24 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(bg_name, 25 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeTimestamp(w_insert_dt, 26 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(w_update_dt, 27 + __off, 93, __dbStmt);
  }
  public void readFields(DataInput __dataIn) throws IOException {
this.readFields0(__dataIn);  }
  public void readFields0(DataInput __dataIn) throws IOException {
    if (__dataIn.readBoolean()) { 
        this.id = null;
    } else {
    this.id = Long.valueOf(__dataIn.readLong());
    }
    if (__dataIn.readBoolean()) { 
        this.delivery_detail_id = null;
    } else {
    this.delivery_detail_id = Long.valueOf(__dataIn.readLong());
    }
    if (__dataIn.readBoolean()) { 
        this.source_code = null;
    } else {
    this.source_code = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.source_header_id = null;
    } else {
    this.source_header_id = Long.valueOf(__dataIn.readLong());
    }
    if (__dataIn.readBoolean()) { 
        this.source_line_id = null;
    } else {
    this.source_line_id = Long.valueOf(__dataIn.readLong());
    }
    if (__dataIn.readBoolean()) { 
        this.shipped_quantity = null;
    } else {
    this.shipped_quantity = Long.valueOf(__dataIn.readLong());
    }
    if (__dataIn.readBoolean()) { 
        this.requested_quantity_uom = null;
    } else {
    this.requested_quantity_uom = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.ship_method_code = null;
    } else {
    this.ship_method_code = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.shipping_instructions = null;
    } else {
    this.shipping_instructions = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.packing_instructions = null;
    } else {
    this.packing_instructions = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.freight_code = null;
    } else {
    this.freight_code = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.last_update_date = null;
    } else {
    this.last_update_date = new Timestamp(__dataIn.readLong());
    this.last_update_date.setNanos(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.createdate = null;
    } else {
    this.createdate = new Timestamp(__dataIn.readLong());
    this.createdate.setNanos(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.disflag = null;
    } else {
    this.disflag = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.jsid = null;
    } else {
    this.jsid = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.dms = null;
    } else {
    this.dms = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.erp = null;
    } else {
    this.erp = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.o_erp_lineid = null;
    } else {
    this.o_erp_lineid = Long.valueOf(__dataIn.readLong());
    }
    if (__dataIn.readBoolean()) { 
        this.o_erp_deliverlineid = null;
    } else {
    this.o_erp_deliverlineid = Long.valueOf(__dataIn.readLong());
    }
    if (__dataIn.readBoolean()) { 
        this.o_erp_lineid_old = null;
    } else {
    this.o_erp_lineid_old = Long.valueOf(__dataIn.readLong());
    }
    if (__dataIn.readBoolean()) { 
        this.jstime = null;
    } else {
    this.jstime = new Timestamp(__dataIn.readLong());
    this.jstime.setNanos(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.received_status_code = null;
    } else {
    this.received_status_code = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.received_status_time = null;
    } else {
    this.received_status_time = new Timestamp(__dataIn.readLong());
    this.received_status_time.setNanos(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.oldflag = null;
    } else {
    this.oldflag = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.bg_name = null;
    } else {
    this.bg_name = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.w_insert_dt = null;
    } else {
    this.w_insert_dt = new Timestamp(__dataIn.readLong());
    this.w_insert_dt.setNanos(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.w_update_dt = null;
    } else {
    this.w_update_dt = new Timestamp(__dataIn.readLong());
    this.w_update_dt.setNanos(__dataIn.readInt());
    }
  }
  public void write(DataOutput __dataOut) throws IOException {
    if (null == this.id) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.id);
    }
    if (null == this.delivery_detail_id) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.delivery_detail_id);
    }
    if (null == this.source_code) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, source_code);
    }
    if (null == this.source_header_id) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.source_header_id);
    }
    if (null == this.source_line_id) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.source_line_id);
    }
    if (null == this.shipped_quantity) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.shipped_quantity);
    }
    if (null == this.requested_quantity_uom) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, requested_quantity_uom);
    }
    if (null == this.ship_method_code) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, ship_method_code);
    }
    if (null == this.shipping_instructions) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, shipping_instructions);
    }
    if (null == this.packing_instructions) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, packing_instructions);
    }
    if (null == this.freight_code) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, freight_code);
    }
    if (null == this.last_update_date) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.last_update_date.getTime());
    __dataOut.writeInt(this.last_update_date.getNanos());
    }
    if (null == this.createdate) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.createdate.getTime());
    __dataOut.writeInt(this.createdate.getNanos());
    }
    if (null == this.disflag) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.disflag);
    }
    if (null == this.jsid) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.jsid);
    }
    if (null == this.dms) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, dms);
    }
    if (null == this.erp) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, erp);
    }
    if (null == this.o_erp_lineid) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.o_erp_lineid);
    }
    if (null == this.o_erp_deliverlineid) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.o_erp_deliverlineid);
    }
    if (null == this.o_erp_lineid_old) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.o_erp_lineid_old);
    }
    if (null == this.jstime) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.jstime.getTime());
    __dataOut.writeInt(this.jstime.getNanos());
    }
    if (null == this.received_status_code) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, received_status_code);
    }
    if (null == this.received_status_time) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.received_status_time.getTime());
    __dataOut.writeInt(this.received_status_time.getNanos());
    }
    if (null == this.oldflag) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, oldflag);
    }
    if (null == this.bg_name) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, bg_name);
    }
    if (null == this.w_insert_dt) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.w_insert_dt.getTime());
    __dataOut.writeInt(this.w_insert_dt.getNanos());
    }
    if (null == this.w_update_dt) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.w_update_dt.getTime());
    __dataOut.writeInt(this.w_update_dt.getNanos());
    }
  }
  public void write0(DataOutput __dataOut) throws IOException {
    if (null == this.id) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.id);
    }
    if (null == this.delivery_detail_id) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.delivery_detail_id);
    }
    if (null == this.source_code) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, source_code);
    }
    if (null == this.source_header_id) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.source_header_id);
    }
    if (null == this.source_line_id) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.source_line_id);
    }
    if (null == this.shipped_quantity) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.shipped_quantity);
    }
    if (null == this.requested_quantity_uom) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, requested_quantity_uom);
    }
    if (null == this.ship_method_code) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, ship_method_code);
    }
    if (null == this.shipping_instructions) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, shipping_instructions);
    }
    if (null == this.packing_instructions) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, packing_instructions);
    }
    if (null == this.freight_code) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, freight_code);
    }
    if (null == this.last_update_date) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.last_update_date.getTime());
    __dataOut.writeInt(this.last_update_date.getNanos());
    }
    if (null == this.createdate) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.createdate.getTime());
    __dataOut.writeInt(this.createdate.getNanos());
    }
    if (null == this.disflag) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.disflag);
    }
    if (null == this.jsid) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.jsid);
    }
    if (null == this.dms) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, dms);
    }
    if (null == this.erp) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, erp);
    }
    if (null == this.o_erp_lineid) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.o_erp_lineid);
    }
    if (null == this.o_erp_deliverlineid) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.o_erp_deliverlineid);
    }
    if (null == this.o_erp_lineid_old) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.o_erp_lineid_old);
    }
    if (null == this.jstime) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.jstime.getTime());
    __dataOut.writeInt(this.jstime.getNanos());
    }
    if (null == this.received_status_code) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, received_status_code);
    }
    if (null == this.received_status_time) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.received_status_time.getTime());
    __dataOut.writeInt(this.received_status_time.getNanos());
    }
    if (null == this.oldflag) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, oldflag);
    }
    if (null == this.bg_name) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, bg_name);
    }
    if (null == this.w_insert_dt) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.w_insert_dt.getTime());
    __dataOut.writeInt(this.w_insert_dt.getNanos());
    }
    if (null == this.w_update_dt) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.w_update_dt.getTime());
    __dataOut.writeInt(this.w_update_dt.getNanos());
    }
  }
  private static final DelimiterSet __outputDelimiters = new DelimiterSet((char) 1, (char) 10, (char) 0, (char) 0, false);
  public String toString() {
    return toString(__outputDelimiters, true);
  }
  public String toString(DelimiterSet delimiters) {
    return toString(delimiters, true);
  }
  public String toString(boolean useRecordDelim) {
    return toString(__outputDelimiters, useRecordDelim);
  }
  public String toString(DelimiterSet delimiters, boolean useRecordDelim) {
    StringBuilder __sb = new StringBuilder();
    char fieldDelim = delimiters.getFieldsTerminatedBy();
    __sb.append(FieldFormatter.escapeAndEnclose(id==null?"null":"" + id, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(delivery_detail_id==null?"null":"" + delivery_detail_id, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(source_code==null?"null":source_code, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(source_header_id==null?"null":"" + source_header_id, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(source_line_id==null?"null":"" + source_line_id, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(shipped_quantity==null?"null":"" + shipped_quantity, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(requested_quantity_uom==null?"null":requested_quantity_uom, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ship_method_code==null?"null":ship_method_code, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(shipping_instructions==null?"null":shipping_instructions, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(packing_instructions==null?"null":packing_instructions, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(freight_code==null?"null":freight_code, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(last_update_date==null?"null":"" + last_update_date, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(createdate==null?"null":"" + createdate, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(disflag==null?"null":"" + disflag, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(jsid==null?"null":"" + jsid, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(dms==null?"null":dms, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(erp==null?"null":erp, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(o_erp_lineid==null?"null":"" + o_erp_lineid, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(o_erp_deliverlineid==null?"null":"" + o_erp_deliverlineid, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(o_erp_lineid_old==null?"null":"" + o_erp_lineid_old, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(jstime==null?"null":"" + jstime, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(received_status_code==null?"null":received_status_code, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(received_status_time==null?"null":"" + received_status_time, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(oldflag==null?"null":oldflag, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(bg_name==null?"null":bg_name, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(w_insert_dt==null?"null":"" + w_insert_dt, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(w_update_dt==null?"null":"" + w_update_dt, delimiters));
    if (useRecordDelim) {
      __sb.append(delimiters.getLinesTerminatedBy());
    }
    return __sb.toString();
  }
  public void toString0(DelimiterSet delimiters, StringBuilder __sb, char fieldDelim) {
    __sb.append(FieldFormatter.escapeAndEnclose(id==null?"null":"" + id, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(delivery_detail_id==null?"null":"" + delivery_detail_id, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(source_code==null?"null":source_code, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(source_header_id==null?"null":"" + source_header_id, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(source_line_id==null?"null":"" + source_line_id, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(shipped_quantity==null?"null":"" + shipped_quantity, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(requested_quantity_uom==null?"null":requested_quantity_uom, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ship_method_code==null?"null":ship_method_code, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(shipping_instructions==null?"null":shipping_instructions, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(packing_instructions==null?"null":packing_instructions, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(freight_code==null?"null":freight_code, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(last_update_date==null?"null":"" + last_update_date, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(createdate==null?"null":"" + createdate, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(disflag==null?"null":"" + disflag, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(jsid==null?"null":"" + jsid, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(dms==null?"null":dms, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(erp==null?"null":erp, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(o_erp_lineid==null?"null":"" + o_erp_lineid, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(o_erp_deliverlineid==null?"null":"" + o_erp_deliverlineid, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(o_erp_lineid_old==null?"null":"" + o_erp_lineid_old, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(jstime==null?"null":"" + jstime, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(received_status_code==null?"null":received_status_code, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(received_status_time==null?"null":"" + received_status_time, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(oldflag==null?"null":oldflag, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(bg_name==null?"null":bg_name, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(w_insert_dt==null?"null":"" + w_insert_dt, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(w_update_dt==null?"null":"" + w_update_dt, delimiters));
  }
  private static final DelimiterSet __inputDelimiters = new DelimiterSet((char) 1, (char) 10, (char) 0, (char) 0, false);
  private RecordParser __parser;
  public void parse(Text __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharSequence __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(byte [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(char [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(ByteBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  private void __loadFromFields(List<String> fields) {
    Iterator<String> __it = fields.listIterator();
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.id = null; } else {
      this.id = Long.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.delivery_detail_id = null; } else {
      this.delivery_detail_id = Long.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.source_code = null; } else {
      this.source_code = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.source_header_id = null; } else {
      this.source_header_id = Long.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.source_line_id = null; } else {
      this.source_line_id = Long.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.shipped_quantity = null; } else {
      this.shipped_quantity = Long.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.requested_quantity_uom = null; } else {
      this.requested_quantity_uom = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.ship_method_code = null; } else {
      this.ship_method_code = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.shipping_instructions = null; } else {
      this.shipping_instructions = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.packing_instructions = null; } else {
      this.packing_instructions = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.freight_code = null; } else {
      this.freight_code = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.last_update_date = null; } else {
      this.last_update_date = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.createdate = null; } else {
      this.createdate = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.disflag = null; } else {
      this.disflag = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.jsid = null; } else {
      this.jsid = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.dms = null; } else {
      this.dms = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.erp = null; } else {
      this.erp = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.o_erp_lineid = null; } else {
      this.o_erp_lineid = Long.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.o_erp_deliverlineid = null; } else {
      this.o_erp_deliverlineid = Long.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.o_erp_lineid_old = null; } else {
      this.o_erp_lineid_old = Long.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.jstime = null; } else {
      this.jstime = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.received_status_code = null; } else {
      this.received_status_code = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.received_status_time = null; } else {
      this.received_status_time = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.oldflag = null; } else {
      this.oldflag = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.bg_name = null; } else {
      this.bg_name = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.w_insert_dt = null; } else {
      this.w_insert_dt = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.w_update_dt = null; } else {
      this.w_update_dt = java.sql.Timestamp.valueOf(__cur_str);
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  private void __loadFromFields0(Iterator<String> __it) {
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.id = null; } else {
      this.id = Long.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.delivery_detail_id = null; } else {
      this.delivery_detail_id = Long.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.source_code = null; } else {
      this.source_code = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.source_header_id = null; } else {
      this.source_header_id = Long.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.source_line_id = null; } else {
      this.source_line_id = Long.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.shipped_quantity = null; } else {
      this.shipped_quantity = Long.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.requested_quantity_uom = null; } else {
      this.requested_quantity_uom = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.ship_method_code = null; } else {
      this.ship_method_code = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.shipping_instructions = null; } else {
      this.shipping_instructions = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.packing_instructions = null; } else {
      this.packing_instructions = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.freight_code = null; } else {
      this.freight_code = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.last_update_date = null; } else {
      this.last_update_date = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.createdate = null; } else {
      this.createdate = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.disflag = null; } else {
      this.disflag = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.jsid = null; } else {
      this.jsid = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.dms = null; } else {
      this.dms = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.erp = null; } else {
      this.erp = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.o_erp_lineid = null; } else {
      this.o_erp_lineid = Long.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.o_erp_deliverlineid = null; } else {
      this.o_erp_deliverlineid = Long.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.o_erp_lineid_old = null; } else {
      this.o_erp_lineid_old = Long.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.jstime = null; } else {
      this.jstime = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.received_status_code = null; } else {
      this.received_status_code = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.received_status_time = null; } else {
      this.received_status_time = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.oldflag = null; } else {
      this.oldflag = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.bg_name = null; } else {
      this.bg_name = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.w_insert_dt = null; } else {
      this.w_insert_dt = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.w_update_dt = null; } else {
      this.w_update_dt = java.sql.Timestamp.valueOf(__cur_str);
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  public Object clone() throws CloneNotSupportedException {
    QueryResult o = (QueryResult) super.clone();
    o.last_update_date = (o.last_update_date != null) ? (java.sql.Timestamp) o.last_update_date.clone() : null;
    o.createdate = (o.createdate != null) ? (java.sql.Timestamp) o.createdate.clone() : null;
    o.jstime = (o.jstime != null) ? (java.sql.Timestamp) o.jstime.clone() : null;
    o.received_status_time = (o.received_status_time != null) ? (java.sql.Timestamp) o.received_status_time.clone() : null;
    o.w_insert_dt = (o.w_insert_dt != null) ? (java.sql.Timestamp) o.w_insert_dt.clone() : null;
    o.w_update_dt = (o.w_update_dt != null) ? (java.sql.Timestamp) o.w_update_dt.clone() : null;
    return o;
  }

  public void clone0(QueryResult o) throws CloneNotSupportedException {
    o.last_update_date = (o.last_update_date != null) ? (java.sql.Timestamp) o.last_update_date.clone() : null;
    o.createdate = (o.createdate != null) ? (java.sql.Timestamp) o.createdate.clone() : null;
    o.jstime = (o.jstime != null) ? (java.sql.Timestamp) o.jstime.clone() : null;
    o.received_status_time = (o.received_status_time != null) ? (java.sql.Timestamp) o.received_status_time.clone() : null;
    o.w_insert_dt = (o.w_insert_dt != null) ? (java.sql.Timestamp) o.w_insert_dt.clone() : null;
    o.w_update_dt = (o.w_update_dt != null) ? (java.sql.Timestamp) o.w_update_dt.clone() : null;
  }

  public Map<String, Object> getFieldMap() {
    Map<String, Object> __sqoop$field_map = new HashMap<String, Object>();
    __sqoop$field_map.put("id", this.id);
    __sqoop$field_map.put("delivery_detail_id", this.delivery_detail_id);
    __sqoop$field_map.put("source_code", this.source_code);
    __sqoop$field_map.put("source_header_id", this.source_header_id);
    __sqoop$field_map.put("source_line_id", this.source_line_id);
    __sqoop$field_map.put("shipped_quantity", this.shipped_quantity);
    __sqoop$field_map.put("requested_quantity_uom", this.requested_quantity_uom);
    __sqoop$field_map.put("ship_method_code", this.ship_method_code);
    __sqoop$field_map.put("shipping_instructions", this.shipping_instructions);
    __sqoop$field_map.put("packing_instructions", this.packing_instructions);
    __sqoop$field_map.put("freight_code", this.freight_code);
    __sqoop$field_map.put("last_update_date", this.last_update_date);
    __sqoop$field_map.put("createdate", this.createdate);
    __sqoop$field_map.put("disflag", this.disflag);
    __sqoop$field_map.put("jsid", this.jsid);
    __sqoop$field_map.put("dms", this.dms);
    __sqoop$field_map.put("erp", this.erp);
    __sqoop$field_map.put("o_erp_lineid", this.o_erp_lineid);
    __sqoop$field_map.put("o_erp_deliverlineid", this.o_erp_deliverlineid);
    __sqoop$field_map.put("o_erp_lineid_old", this.o_erp_lineid_old);
    __sqoop$field_map.put("jstime", this.jstime);
    __sqoop$field_map.put("received_status_code", this.received_status_code);
    __sqoop$field_map.put("received_status_time", this.received_status_time);
    __sqoop$field_map.put("oldflag", this.oldflag);
    __sqoop$field_map.put("bg_name", this.bg_name);
    __sqoop$field_map.put("w_insert_dt", this.w_insert_dt);
    __sqoop$field_map.put("w_update_dt", this.w_update_dt);
    return __sqoop$field_map;
  }

  public void getFieldMap0(Map<String, Object> __sqoop$field_map) {
    __sqoop$field_map.put("id", this.id);
    __sqoop$field_map.put("delivery_detail_id", this.delivery_detail_id);
    __sqoop$field_map.put("source_code", this.source_code);
    __sqoop$field_map.put("source_header_id", this.source_header_id);
    __sqoop$field_map.put("source_line_id", this.source_line_id);
    __sqoop$field_map.put("shipped_quantity", this.shipped_quantity);
    __sqoop$field_map.put("requested_quantity_uom", this.requested_quantity_uom);
    __sqoop$field_map.put("ship_method_code", this.ship_method_code);
    __sqoop$field_map.put("shipping_instructions", this.shipping_instructions);
    __sqoop$field_map.put("packing_instructions", this.packing_instructions);
    __sqoop$field_map.put("freight_code", this.freight_code);
    __sqoop$field_map.put("last_update_date", this.last_update_date);
    __sqoop$field_map.put("createdate", this.createdate);
    __sqoop$field_map.put("disflag", this.disflag);
    __sqoop$field_map.put("jsid", this.jsid);
    __sqoop$field_map.put("dms", this.dms);
    __sqoop$field_map.put("erp", this.erp);
    __sqoop$field_map.put("o_erp_lineid", this.o_erp_lineid);
    __sqoop$field_map.put("o_erp_deliverlineid", this.o_erp_deliverlineid);
    __sqoop$field_map.put("o_erp_lineid_old", this.o_erp_lineid_old);
    __sqoop$field_map.put("jstime", this.jstime);
    __sqoop$field_map.put("received_status_code", this.received_status_code);
    __sqoop$field_map.put("received_status_time", this.received_status_time);
    __sqoop$field_map.put("oldflag", this.oldflag);
    __sqoop$field_map.put("bg_name", this.bg_name);
    __sqoop$field_map.put("w_insert_dt", this.w_insert_dt);
    __sqoop$field_map.put("w_update_dt", this.w_update_dt);
  }

  public void setField(String __fieldName, Object __fieldVal) {
    if (!setters.containsKey(__fieldName)) {
      throw new RuntimeException("No such field:"+__fieldName);
    }
    setters.get(__fieldName).setField(__fieldVal);
  }

}
