FasdUAS 1.101.10   ��   ��    k             i         I     �� 	��
�� .GURLGURLnull��� ��� TEXT 	 o      ���� 0 this_url this_URL��    k     % 
 
     l     ��������  ��  ��        r         b         b         m        �   T / o p t / h o m e b r e w / b i n / t r a n s m i s s i o n - r e m o t e   - a   "  o    ���� 0 this_url this_URL  m       �    "  o      ���� 0 add_cmd        r        I   �� ��
�� .sysoexecTEXT���     TEXT  o    	���� 0 add_cmd  ��    o      ���� 0 response        l   ��������  ��  ��       !   Z    # " #���� " J     $ $  %�� % D     & ' & o    ���� 0 response   ' m     ( ( � ) )  s u c c e s s��   # I   �� * +
�� .sysonotfnull��� ��� TEXT * m     , , � - -  F i l e   a d d e d . + �� .��
�� 
appr . m     / / � 0 0  T r a n s m i t t e r��  ��  ��   !  1 2 1 l  $ $��������  ��  ��   2  3 4 3 l   $ $�� 5 6��   5��set added_index to offset of "added" in response
	set duplicate_index to offset of "duplicate" in response
	
	if added_index is 0 then
		display notification "File added succesfully!" with title "Transmitter"
		delay 0.5
	else if duplicate_index is not 0 then
		display notification "Duplicated file!" with title "Transmitter"
		delay 0.5
	else
		display dialog "Error adding file: " & response
	end if    6 � 7 7$ s e t   a d d e d _ i n d e x   t o   o f f s e t   o f   " a d d e d "   i n   r e s p o n s e 
 	 s e t   d u p l i c a t e _ i n d e x   t o   o f f s e t   o f   " d u p l i c a t e "   i n   r e s p o n s e 
 	 
 	 i f   a d d e d _ i n d e x   i s   0   t h e n 
 	 	 d i s p l a y   n o t i f i c a t i o n   " F i l e   a d d e d   s u c c e s f u l l y ! "   w i t h   t i t l e   " T r a n s m i t t e r " 
 	 	 d e l a y   0 . 5 
 	 e l s e   i f   d u p l i c a t e _ i n d e x   i s   n o t   0   t h e n 
 	 	 d i s p l a y   n o t i f i c a t i o n   " D u p l i c a t e d   f i l e ! "   w i t h   t i t l e   " T r a n s m i t t e r " 
 	 	 d e l a y   0 . 5 
 	 e l s e 
 	 	 d i s p l a y   d i a l o g   " E r r o r   a d d i n g   f i l e :   "   &   r e s p o n s e 
 	 e n d   i f 4  8�� 8 l  $ $��������  ��  ��  ��     9 : 9 l     ��������  ��  ��   :  ;�� ; i     < = < I     ������
�� .aevtoappnull  �   � ****��  ��   = k      > >  ? @ ? I    �� A��
�� .sysodlogaskr        TEXT A m      B B � C C  T r a n s m i t t e r   1 . 1��   @  D E D I   �� F��
�� .sysodelanull��� ��� nmbr F m    ���� ��   E  G�� G I   �� H��
�� .sysonotfnull��� ��� TEXT H m     I I � J J 
 . .   . .��  ��  ��       �� K L M��   K ����
�� .GURLGURLnull��� ��� TEXT
�� .aevtoappnull  �   � **** L �� ���� N O��
�� .GURLGURLnull��� ��� TEXT�� 0 this_url this_URL��   N �������� 0 this_url this_URL�� 0 add_cmd  �� 0 response   O   �� ( ,�� /��
�� .sysoexecTEXT���     TEXT
�� 
appr
�� .sysonotfnull��� ��� TEXT�� &�%�%E�O�j E�O��kv ���l Y hOP M �� =���� P Q��
�� .aevtoappnull  �   � ****��  ��   P   Q  B���� I��
�� .sysodlogaskr        TEXT
�� .sysodelanull��� ��� nmbr
�� .sysonotfnull��� ��� TEXT�� �j Okj O�j ascr  ��ޭ