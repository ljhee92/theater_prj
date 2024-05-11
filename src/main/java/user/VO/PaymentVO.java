package user.VO;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class PaymentVO {

	private String paymentNumber, reservationNumber, totalPrice, paymentMethod;
	private Date paymentDate;
	
} // class