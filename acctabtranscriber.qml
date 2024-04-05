//=============================================================================
//  MuseScore
//  Music Composition & Notation
//
//  Accordion Tab Transcriber
//  Remix of "Note Names" plugin
//
//  Copyright (C) 2012 Werner Schweer
//  Copyright (C) 2013 - 2021 Joachim Schmitz
//  Copyright (C) 2014 Jörn Eichler
//  Copyright (C) 2020 Johan Temmerman
//  Copyright (C) 2024 Calum Matheson
//
//  This program is free software; you can redistribute it and/or modify
//  it under the terms of the GNU General Public License version 2
//  as published by the Free Software Foundation and appearing in
//  the file LICENCE.GPL
//=============================================================================

import QtQuick 2.2
import MuseScore 3.0

MuseScore {
   version: "4.0"
   description: "Transcribes notes to B/C/C# diatonic accordion tab"
   title: "Accordion Tab Transcriber"
   categoryCode: "composing-arranging-tools"

   // Small note name size is fraction of the full font size.
   property real fontSizeMini: 0.7;

   function nameChord (notes, text, small) {
      var sep = "\n";   // change to "," if you want them horizontally (anybody?)
      var oct = "";
      var name;
      for (var i = 0; i < notes.length; i++) {
         if (!notes[i].visible)
            continue // skip invisible notes
         if (text.text) // only if text isn't empty
            text.text = sep + text.text;
         if (small)
            text.fontSize *= fontSizeMini
         if (typeof notes[i].tpc === "undefined") // like for grace notes ?!?
            return

         // octave, middle C being C4
         oct = (Math.floor(notes[i].pitch / 12) - 1)

         switch(oct) {
         case 3: {
             switch (notes[i].tpc) {
             case  6: name = qsTranslate("global", "1I"); break; // Fb3
             // case  7: name = qsTranslate("global", "C♭3"); break;
             case  8: name = qsTranslate("global", "[2I]"); break; // Gb3
             // case  9: name = qsTranslate("global", "D♭3"); break;
             case 10: name = qsTranslate("global", "[1O]"); break; // Ab3
             case 11: name = qsTranslate("global", "[1I]"); break; // Eb3
             case 12: name = qsTranslate("global", "[2O]"); break; // Bb3

             case 13: name = qsTranslate("global", "(21)"); break; // F3
             // case 14: name = qsTranslate("global", "C3"); break;
             case 15: name = qsTranslate("global", "2I"); break; // G3
             // case 16: name = qsTranslate("global", "D3"); break;
             case 17: name = qsTranslate("global", "1O"); break; // A3
             case 18: name = qsTranslate("global", "1I"); break; // E3
             case 19: name = qsTranslate("global", "[3I] or 2O"); break; // B3

             case 20: name = qsTranslate("global", "[2I]"); break; // F#3
             // case 21: name = qsTranslate("global", "C♯3"); break;
             case 22: name = qsTranslate("global", "[1O]"); break; // G#3
             case 23: name = qsTranslate("global", "[1I]"); break; // D#3
             case 24: name = qsTranslate("global", "[2O]"); break; // A#3
             case 25: name = qsTranslate("global", "(21)"); break; // E#3
             // case 26: name = qsTranslate("global", "B♯3"); break;
             default: name = qsTranslate("global", "???"); break;
             }
             break
         }

         case 4: {
             switch (notes[i].tpc) {
             case  6: name = qsTranslate("global", "4I"); break; // Fb4
             case  7: name = qsTranslate("global", "[1I]"); break; // Cb4
             case  8: name = qsTranslate("global", "[5I]"); break; // Gb4
             case  9: name = qsTranslate("global", "[3O]"); break; // Db4
             case 10: name = qsTranslate("global", "[5O]"); break; // Ab4
             case 11: name = qsTranslate("global", "[4I]"); break; // Eb4
             case 12: name = qsTranslate("global", "[6O]"); break; // Bb4

             case 13: name = qsTranslate("global", "4O"); break; // F4
             case 14: name = qsTranslate("global", "3I"); break; // C4
             case 15: name = qsTranslate("global", "5I"); break; // G4
             case 16: name = qsTranslate("global", "3O"); break; // D4
             case 17: name = qsTranslate("global", "5O"); break; // A4
             case 18: name = qsTranslate("global", "4I or [4O]"); break; // E4
             case 19: name = qsTranslate("global", "[6I] or 6O"); break; // B4

             case 20: name = qsTranslate("global", "[5I]"); break; // F#4
             case 21: name = qsTranslate("global", "[3O]"); break; // C#4
             case 22: name = qsTranslate("global", "[5O]"); break; // G#4
             case 23: name = qsTranslate("global", "[4I]"); break; // D#4
             case 24: name = qsTranslate("global", "[6O]"); break; // A#4
             case 25: name = qsTranslate("global", "4O"); break; // E#4
             case 26: name = qsTranslate("global", "6I"); break; // B#4
             default: name = qsTranslate("global", "???"); break;
             }
             break
         }

         case 5: {
             switch (notes[i].tpc) {
             case  6: name = qsTranslate("global", "7I"); break; // Fb5
             case  7: name = qsTranslate("global", "[6I]"); break; // Cb5
             case  8: name = qsTranslate("global", "[8I]"); break; // Gb5
             case  9: name = qsTranslate("global", "[7O]"); break; // Db5
             case 10: name = qsTranslate("global", "[9O]"); break; // Ab5
             case 11: name = qsTranslate("global", "[7I]"); break; // Eb5
             case 12: name = qsTranslate("global", "[10O]"); break; // Bb5

             case 13: name = qsTranslate("global", "8O"); break; // F5
             case 14: name = qsTranslate("global", "6I"); break; // C5
             case 15: name = qsTranslate("global", "8I"); break; // G5
             case 16: name = qsTranslate("global", "7O"); break; // D5
             case 17: name = qsTranslate("global", "9O"); break; // A5
             case 18: name = qsTranslate("global", "7I or [8O]"); break; // E5
             case 19: name = qsTranslate("global", "[9I] or 10O"); break; // B5

             case 20: name = qsTranslate("global", "[8I]"); break; // F#5
             case 21: name = qsTranslate("global", "[7O]"); break; // C#5
             case 22: name = qsTranslate("global", "[9O]"); break; // G#5
             case 23: name = qsTranslate("global", "[7I]"); break; // D#5
             case 24: name = qsTranslate("global", "[10O]"); break; // A#5
             case 25: name = qsTranslate("global", "8O"); break; // E#5
             case 26: name = qsTranslate("global", "9I"); break; // B#5
             default: name = qsTranslate("global", "???"); break;
             }
             break
         }

         case 6: {
         switch (notes[i].tpc) {
             case  6: name = qsTranslate("global", "10I"); break; // Fb6
             case  7: name = qsTranslate("global", "[9I]"); break; // Cb6
             case  8: name = qsTranslate("global", "[11I]"); break; // Gb6
             case  9: name = qsTranslate("global", "[11O]"); break; // Db6
             // case 10: name = qsTranslate("global", "A♭6"); break;
             case 11: name = qsTranslate("global", "[10I]"); break;  // Eb6
             // case 12: name = qsTranslate("global", "B♭6"); break;

             // case 13: name = qsTranslate("global", "F6"); break;
             case 14: name = qsTranslate("global", "9I"); break; // C6
             // case 15: name = qsTranslate("global", "G6"); break;
             case 16: name = qsTranslate("global", "11O"); break; // D6
             // case 17: name = qsTranslate("global", "A6"); break;
             case 18: name = qsTranslate("global", "10I"); break; // E6
             // case 19: name = qsTranslate("global", "B6"); break;

             case 20: name = qsTranslate("global", "[11I]"); break; // F#6
             case 21: name = qsTranslate("global", "[11O]"); break; // C#6
             // case 22: name = qsTranslate("global", "G♯6"); break;
             case 23: name = qsTranslate("global", "[10I]"); break; // D#6
             // case 24: name = qsTranslate("global", "A♯6"); break;
             // case 25: name = qsTranslate("global", "E♯6"); break;
             // case 26: name = qsTranslate("global", "B♯6"); break;
             default: name = qsTranslate("global", "???"); break;
             }
             break;
         }

         default: name = qsTranslate("global", "???"); break;
         }

         text.text = name;
      }  // end for note
   }

   function renderGraceNoteNames (cursor, list, text, small) {
      if (list.length > 0) {     // Check for existence.
         // Now render grace note's names...
         for (var chordNum = 0; chordNum < list.length; chordNum++) {
            // iterate through all grace chords
            var chord = list[chordNum];
            // Set note text, grace notes are shown a bit smaller
            nameChord(chord.notes, text, small)
            if (text.text)
               cursor.add(text)
            // X position the note name over the grace chord
            text.offsetX = chord.posX
            switch (cursor.voice) {
               case 1: case 3: text.placement = Placement.BELOW; break;
            }

            // If we consume a STAFF_TEXT we must manufacture a new one.
            if (text.text)
               text = newElement(Element.STAFF_TEXT);    // Make another STAFF_TEXT
         }
      }
      return text
   }

   onRun: {
      curScore.startCmd()

      var cursor = curScore.newCursor();
      var startStaff;
      var endStaff;
      var endTick;
      var fullScore = false;
      cursor.rewind(1);
      if (!cursor.segment) { // no selection
         fullScore = true;
         startStaff = 0; // start with 1st staff
         endStaff  = curScore.nstaves - 1; // and end with last
      } else {
         startStaff = cursor.staffIdx;
         cursor.rewind(2);
         if (cursor.tick === 0) {
            // this happens when the selection includes
            // the last measure of the score.
            // rewind(2) goes behind the last segment (where
            // there's none) and sets tick=0
            endTick = curScore.lastSegment.tick + 1;
         } else {
            endTick = cursor.tick;
         }
         endStaff = cursor.staffIdx;
      }
      console.log(startStaff + " - " + endStaff + " - " + endTick)

      for (var staff = startStaff; staff <= endStaff; staff++) {
         for (var voice = 0; voice < 4; voice++) {
            cursor.rewind(1); // beginning of selection
            cursor.voice    = voice;
            cursor.staffIdx = staff;

            if (fullScore)  // no selection
               cursor.rewind(0); // beginning of score
            while (cursor.segment && (fullScore || cursor.tick < endTick)) {
               if (cursor.element && cursor.element.type === Element.CHORD) {
                  var text = newElement(Element.STAFF_TEXT);      // Make a STAFF_TEXT

                  // First...we need to scan grace notes for existence and break them
                  // into their appropriate lists with the correct ordering of notes.
                  var leadingLifo = Array();   // List for leading grace notes
                  var trailingFifo = Array();  // List for trailing grace notes
                  var graceChords = cursor.element.graceNotes;
                  // Build separate lists of leading and trailing grace note chords.
                  if (graceChords.length > 0) {
                     for (var chordNum = 0; chordNum < graceChords.length; chordNum++) {
                        var noteType = graceChords[chordNum].notes[0].noteType
                        if (noteType === NoteType.GRACE8_AFTER || noteType === NoteType.GRACE16_AFTER ||
                              noteType === NoteType.GRACE32_AFTER) {
                           trailingFifo.unshift(graceChords[chordNum])
                        } else {
                           leadingLifo.push(graceChords[chordNum])
                        }
                     }
                  }

                  // Next process the leading grace notes, should they exist...
                  text = renderGraceNoteNames(cursor, leadingLifo, text, true)

                  // Now handle the note names on the main chord...
                  var notes = cursor.element.notes;
                  nameChord(notes, text, false);
                  if (text.text)
                     cursor.add(text);

                  switch (cursor.voice) {
                     case 1: case 3: text.placement = Placement.BELOW; break;
                  }

                  if (text.text)
                     text = newElement(Element.STAFF_TEXT) // Make another STAFF_TEXT object

                  // Finally process trailing grace notes if they exist...
                  text = renderGraceNoteNames(cursor, trailingFifo, text, true)
               } // end if CHORD
               cursor.next();
            } // end while segment
         } // end for voice
      } // end for staff

      curScore.endCmd()
      quit();
   } // end onRun
}
